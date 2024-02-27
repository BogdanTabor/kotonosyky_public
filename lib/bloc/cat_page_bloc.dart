import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotonosyky/objects/siteData.dart';

import '../../../db_manager.dart';
import '../../../objects/cat.dart';
import '../utilities/translit.dart';

part 'cat_page_event.dart';
part 'cat_page_state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  final loadCatCompleter = Completer<void>();
  final DBManager _dbManager;
  late StreamSubscription<List<Cat>> _catsStream;
  int limit = 50; // TODO 50
  int plusLimit = 10; // TODO 10
  Cat? sharedCat;
  List<Cat> initCats = [];
  List<Cat> tempCats = [];
  List<Cat> filterCats = [];
  List<Cat> searchCats = [];
  Iterable<Cat> adoptedCats = [];
  Set<int> filtersID = {};
  SiteData? siteData;
  String? searchQuery = '';
  String langCode = '';
  bool searching = false;
  bool filtering = false;
  bool translating = false;
  bool sharedCatLoaded = false;

  @override
  Future<void> close() async {
    _catsStream.cancel();
    super.close();
  }

  CatsBloc(this._dbManager) : super(LoadingCatsState()) {
    on<CatsLoadedEvent>(
      (event, emit) async {
        final int catsOnSiteCount = await DBManager().getCatsCount();
        siteData ??= await DBManager().fetchSiteData();
        final bool moreAvailable = event.list.length == limit;
        if (!searching && !filtering) {
          initCats = List.from(event.list);
          tempCats = List.from(event.list);
        }
        if (sharedCat != null) {
          tempCats.removeWhere((cat) => cat.id == sharedCat!.id);
          tempCats.insert(0, sharedCat!);
          sharedCatLoaded = true;
          // todo run sort if "shared cat"
          // todo ? how to remove CatID from url after user move from CatDetailsPage
          // todo ? how to add CatID to url when CatDetailsPage changing?
        }
        if (langCode.isNotEmpty) {
          tempCats = translateCats(langCode, event.list);
        }
        emit(CatsLoadedState(
          cats: tempCats,
          moreAvailable: moreAvailable,
          catsOnSiteCount: catsOnSiteCount,
          searchQuery: searchQuery ?? '',
          sharedCatLoaded: sharedCatLoaded,
          siteData: siteData!,
          filtersID: filtersID,
        ));
      },
    );

    on<LanguageChangeEvent>((event, emit) async {
      if (event.langCode != langCode) {
        langCode = event.langCode;
        if (event.langCode == 'uk') {
          _catsStream.cancel();
          _catsStream = _dbManager.catsStream(limit).listen((cats) {
            add(CatsLoadedEvent(cats));
          });
          filtersID = {};
        } else {
          add(CatsLoadedEvent(tempCats));
        }
      }
    });

    on<LoadCatsEvent>((event, emit) async {
      _catsStream = _dbManager
          .catsStream(limit)
          .listen((cats) => add(CatsLoadedEvent(cats)));
    });

    on<LoadCatIdEvent>((event, emit) async {
      sharedCat = await _dbManager.getCatById(event.catID!);
      add(const LoadCatsEvent());
    });

    on<FilterEvent>((event, emit) async {
      filter(event.filtersID);
      filtersID = event.filtersID;
      add(CatsLoadedEvent(tempCats));
    });

    on<SearchEvent>((event, emit) async {
      search(event.query);
      add(CatsLoadedEvent(tempCats));
    });

    on<AdoptedEvent>((event, emit) async {
      try {
        adoptedCats = await _dbManager.getAdopted();
        filtersID = event.filtersID;
        add(FilterEvent(event.filtersID));
        // todo run sort if filter "all cats"
      } catch (e) {
        if (kDebugMode) {
          print('Error fetching adopted cats: $e');
        }
      }
    });

    on<LoadMoreEvent>((event, emit) {
      _catsStream.cancel();
      limit = limit + plusLimit;
      _catsStream = _dbManager.catsStream(limit).listen((event) {
        add(CatsLoadedEvent(event));
      });
    });
  }

  List<Cat> translateCats(String langCode, List<Cat> list) {
    return list.map((cat) {
      String transName = '';
      String transLocation = '';
      String description = _getDescriptionForLanguage(cat, langCode)!;
      String features = _getFeaturesForLanguage(cat, langCode)!;
      if (langCode != 'uk') {
        transName = Translit().toTranslit(source: cat.name);
        transLocation = Translit().toTranslit(source: cat.location!);
      } else {
        transName = cat.name;
        transLocation = cat.location!;
      }

      return cat.copyWith(
        description: description,
        features: features,
        name: transName,
        location: transLocation,
      );
    }).toList();
  }

  String? _getDescriptionForLanguage(Cat cat, String languageCode) {
    switch (languageCode) {
      case 'en':
        return cat.descriptionEn ?? cat.description;
      case 'de':
        return cat.descriptionDe ?? cat.description;
      default:
        return cat.description ?? '';
    }
  }

  String? _getFeaturesForLanguage(Cat cat, String languageCode) {
    switch (languageCode) {
      case 'en':
        return cat.featuresEn ?? cat.features;
      case 'de':
        return cat.featuresDe ?? cat.features;
      default:
        return cat.features ?? '';
    }
  }

  bool nameQuery(Cat cat, String query) {
    return cat.name.toLowerCase().contains(query.toLowerCase());
  }

  void search(String query) {
    searchQuery = query;
    Iterable<Cat> filteredCats;

    if (query.isEmpty) {
      searching = false;
      filteredCats = filtering ? filterCats : initCats;
    } else {
      searching = true;
      filteredCats = filtering ? filterCats : initCats;
      filteredCats = filteredCats.where((cat) => nameQuery(cat, query));
      searchCats = initCats.where((cat) => nameQuery(cat, query)).toList();
    }
    tempCats = List.from(filteredCats);
  }

  void filter(Set<int> fID) {
    Set<int> initIndex = {1, 4, 7, 11, 21, 31, 41};
    bool initFilter = initIndex.every(fID.contains);

    if (initFilter) {
      filtering = false;
      tempCats = List.from(searching ? searchCats : initCats);
    } else {
      filtering = true;
      Iterable<Cat> query = List.from(searching ? searchCats : initCats);

      /// SEX FILTER
      if (fID.contains(2) || fID.contains(3)) {
        String option = fID.contains(2) ? 'котик' : 'киця';
        query = query.where((cat) => cat.sex == option);
      }

      /// FEATURES FILTER
      if (fID.contains(5)) {
        query = query.where((cat) => cat.features != '');
      }

      if (fID.contains(6) || fID.contains(7) || fID.contains(8)) {
        if (fID.contains(6) || fID.contains(7)) {
          if (fID.contains(6)) {
            query = adoptedCats.followedBy(query);
          }
          if (fID.contains(7)) {
            // шукають
            query = query.where((cat) => cat.adopted != null);
          }
        }
        if (fID.contains(8)) {
          // знайшли
          query =
              query.where((cat) => cat.adopted == true).followedBy(adoptedCats);
        }
      }

      /// AGE FILTER
      if (fID.contains(12) ||
          fID.contains(13) ||
          fID.contains(14) ||
          fID.contains(15)) {
        int now = DateTime.now().millisecondsSinceEpoch;
        int year = 31556926000;

        query = query.where((cat) {
          int ageDifference = now - cat.birthDate.millisecondsSinceEpoch;
          if (fID.contains(12)) {
            return ageDifference < year;
          } else if (fID.contains(13)) {
            return ageDifference >= year && ageDifference < year * 4;
          } else if (fID.contains(14)) {
            return ageDifference >= year * 4 && ageDifference < year * 10;
          } else if (fID.contains(15)) {
            return ageDifference >= year * 10;
          }
          return true;
        });
      }

      /// SHELTER TIME FILTER
      if (fID.contains(22) ||
          fID.contains(23) ||
          fID.contains(24) ||
          fID.contains(25)) {
        int now = DateTime.now().millisecondsSinceEpoch;
        double month = 2629743833.3;

        query = query.where((cat) {
          if (cat.shelterArriveDate != null) {
            int shelterDays =
                now - cat.shelterArriveDate!.millisecondsSinceEpoch;
            if (fID.contains(22)) {
              return shelterDays < month;
            } else if (fID.contains(23)) {
              return shelterDays >= month && shelterDays < month * 6;
            } else if (fID.contains(24)) {
              return shelterDays >= month * 6 && shelterDays < month * 12;
            } else if (fID.contains(25)) {
              return shelterDays >= month * 12;
            }
          }
          return true;
        });
      }

      // todo make locations as list from DB, and "add new location" OR get/make library with real locations
      // todo color (new field)

      tempCats = query.toList();
      filterCats = query.toList();
    }
  }
}
