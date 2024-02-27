part of 'cat_page_bloc.dart';

abstract class CatsState extends Equatable {
  const CatsState();
}

class CatsLoadedState extends CatsState {
  final List<Cat> cats;
  final bool moreAvailable;
  final int catsOnSiteCount;
  final String searchQuery;
  final bool? sharedCatLoaded;
  final SiteData siteData;
  final Set<int> filtersID;
  const CatsLoadedState({
    required this.cats,
    required this.moreAvailable,
    required this.catsOnSiteCount,
    required this.searchQuery,
    required this.siteData,
    required this.filtersID,
    this.sharedCatLoaded,
  });
  @override
  List<Object> get props => [
        cats,
        moreAvailable,
        catsOnSiteCount,
        siteData,
        filtersID,
      ];
}

class LoadingCatsState extends CatsState {
  @override
  List<Object> get props => [];
}
