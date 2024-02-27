import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/cat_page_bloc.dart';
import '../objects/cat.dart';
import '../utilities/analitic_service.dart';
import 'about_page/about_page.dart';
import 'about_page/app_bar.dart';
import 'cat_details_page/details_parent_widget.dart';
import 'cat_details_page/navigation_button.dart';
import 'cats_list/cats_list.dart';
import 'cats_list/filter_menu.dart';

class CatPage extends StatefulWidget {
  final String? catID;

  const CatPage({Key? key, this.catID}) : super(key: key);

  @override
  State<CatPage> createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  final PageController page = PageController(
    initialPage: 0,
    keepPage: true,
  );
  bool initialVisit = true;
  int currentPage = 0;
  int lastPageIndex = 2;
  bool lastPageCatList = false;
  late List<Cat> catsData;
  Set<int> filtersID = {};
  bool filterOpen = false;
  bool adoptedLoaded = false;
  bool showAdopted = false;
  bool openedCatID = false;
  String? sortOption;
  String searchQuery = '';

  void setInitialVisitFalse() => setState(() => initialVisit = false);
  void setLastPageCatListFalse() => setState(() => lastPageCatList = false);

  @override
  void initState() {
    super.initState();
    AnalyticsService.logPageEvent('home');
    if (widget.catID != null && !openedCatID) {
      context.read<CatsBloc>().add(LoadCatIdEvent(widget.catID));
    } else {
      context.read<CatsBloc>().add(const LoadCatsEvent());
    }
  }

  void handlePageChange(int index) {
    setState(() {
      if (index - 2 >= 0 && index - 2 < catsData.length) {
        AnalyticsService.logPageEvent(catsData[index - 2].name);
        if (filterOpen) {
          filterOpen = false;
        }
        lastPageIndex = index;
        lastPageCatList = false;
      }
      if (index == 1 || index == catsData.length + 2) {
        AnalyticsService.logPageEvent('cats_list');
        lastPageCatList = true;
      }
      if (index == 0) {
        AnalyticsService.logPageEvent('home');
        if (filterOpen) {
          filterOpen = false;
        }
      }
      currentPage = index;
    });
  }

  void jumpToCat() {
    if (!openedCatID) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => openedCatID = true);
        page.jumpToPage(2);
        AnalyticsService.logOpenLink(catsData.first.name);
      });
    }
  }

  void setData(String id, List<Cat> cats) {
    if (catsData.length < cats.length) {
      setState(() => catsData = cats);
    }
    if (catsData.isNotEmpty) {
      int newIndex = catsData.indexWhere((cat) => cat.id == id);
      setState(() {
        lastPageIndex = newIndex + 2;
        currentPage = newIndex + 2;
        initialVisit = false;
      });
      page.jumpToPage(lastPageIndex);
    }
  }

  @override
  void dispose() {
    page.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isCatDetailsPage = currentPage != 0 &&
        currentPage != 1 &&
        currentPage - 2 < catsData.length;
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: !isCatDetailsPage
          ? PreferredSize(
              preferredSize: const Size(double.infinity, 62),
              child: BlocConsumer<CatsBloc, CatsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is CatsLoadedState) {
                    filtersID = state.filtersID;
                    return Center(
                      child: CatAppBar(
                        currentPage: currentPage,
                        lastPageIndex: lastPageIndex,
                        page: page,
                        lastPageCatList: lastPageCatList,
                        firstOpen: initialVisit,
                        setInitialVisitFalse: setInitialVisitFalse,
                        setLastPageCatListFalse: setLastPageCatListFalse,
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            )
          : null,
      body: BlocConsumer<CatsBloc, CatsState>(
        listener: (context, state) {
          if (state is CatsLoadedState && state.sharedCatLoaded == true) {
            jumpToCat();
          }
        },
        builder: (context, state) {
          if (state is LoadingCatsState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CatsLoadedState) {
            List<Cat> cats = state.cats;
            catsData = state.cats;
            int itemCount = cats.length + 3;
            return GestureDetector(
              onTap: () {
                if (filterOpen && screen.width < 1140) {
                  toggleFilterDrawer();
                }
              },
              child: Stack(
                children: [
                  RawKeyboardListener(
                    autofocus: true,
                    focusNode: FocusNode(),
                    onKey: (event) {
                      if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
                        // Check if nextPage can animate
                        if (page.page! < itemCount - 1) {
                          page.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      }
                      if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
                        // Check if previousPage can animate
                        if (page.page! > 0) {
                          page.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      }
                      if (event.isKeyPressed(LogicalKeyboardKey.escape)) {
                        if (filterOpen) {
                          toggleFilterDrawer();
                        }
                      }
                    },
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: PageView.builder(
                          controller: page,
                          physics: currentPage == 0 || currentPage == 1
                              ? const NeverScrollableScrollPhysics()
                              : const BouncingScrollPhysics(),
                          dragStartBehavior: DragStartBehavior.down,
                          scrollDirection: Axis.vertical,
                          itemCount: itemCount,
                          onPageChanged: (index) => handlePageChange(index),
                          itemBuilder: (context, index) {
                            /// ABOUT PAGE
                            if (index == 0) {
                              return AboutPage(
                                pageController: page,
                                siteData: state.siteData,
                              );
                            }

                            /// CATS LIST
                            else if (index == 1) {
                              return CatsList(
                                pageController: page,
                                setData: (id, cats) {
                                  setData(id, cats);
                                },
                                sortOption: sortOption,
                                toggleSortOrder: toggleSortOrder,
                                searchName: (query) => searchName(query),
                                toggleFilterDrawer: () => toggleFilterDrawer(),
                                filtersLength: getFilterLength(state.filtersID),
                                searchQuery: searchQuery,
                              );

                              /// LOAD MORE CATS BUTTON
                            } else {
                              if (index >= cats.length && state.moreAvailable) {
                                context
                                    .read<CatsBloc>()
                                    .add(const LoadMoreEvent());
                              }

                              /// CAT DETAILS PAGE
                              if (index - 2 >= 0 && index - 2 < cats.length) {
                                Cat cat = cats[index - 2];
                                return DetailsParentWidget(
                                    cat: cat, siteData: state.siteData);
                              }
                            }

                            /// LAST PAGE - CATS LIST
                            return CatsList(
                              pageController: page,
                              setData: (id, cats) {
                                setData(id, cats);
                              },
                              sortOption: sortOption,
                              toggleSortOrder: toggleSortOrder,
                              searchName: (query) => searchName(query),
                              toggleFilterDrawer: () => toggleFilterDrawer(),
                              filtersLength: getFilterLength(state.filtersID),
                              searchQuery: searchQuery,
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  /// FILTER DRAWER
                  Visibility(
                    visible: screen.width < 1140,
                    child: AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      left: filterOpen ? 0 : -screen.width,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.01),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: filterOpen ? 1 : 0,
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                height: screen.height - 60,
                                color: Colors.white24,
                                child: FilterMenu(
                                  showAdopted: showAdopted,
                                  filterActive:
                                      getFilterLength(state.filtersID) != 0,
                                  setFilters: (ids) => filterCats(ids),
                                  toggleFilterDrawer: () =>
                                      toggleFilterDrawer(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// FILTER
                  Positioned(
                    left: (screen.width - 1139) / 2,
                    child: Visibility(
                      visible: (screen.width > 1139 && filterOpen),
                      child: SizedBox(
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            FilterMenu(
                              showAdopted: showAdopted,
                              filterActive:
                                  getFilterLength(state.filtersID) != 0,
                              setFilters: (ids) => filterCats(ids),
                              toggleFilterDrawer: () => toggleFilterDrawer(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// NAVIGATE TO ABOUT PAGE
                  if (isCatDetailsPage)
                    NavigationButton(
                      onPressed: () => page.jumpToPage(0),
                      iconData: Icons.home_outlined,
                      alignmentPosition: const [-0.95, -0.95],
                    ),

                  /// NAVIGATE TO CATS LIST
                  if (isCatDetailsPage)
                    NavigationButton(
                      onPressed: () {
                        initialVisit = false;
                        page.jumpToPage(1);
                      },
                      iconData: Icons.collections_outlined,
                      alignmentPosition: const [0.95, -0.95],
                    ),
                ],
              ),
            );
          } else {
            return Center(child: Text(AppLocalizations.of(context)!.error));
          }
        },
      ),
    );
  }

  int getFilterLength(Set<int> list) {
    Set<int> initIndex = {1, 4, 7, 11, 21, 31, 41};
    int length = 0;
    for (int item in list) {
      if (!initIndex.contains(item)) {
        length++;
      }
    }
    return length;
  }

  void toggleSortOrder(value, ascending) {
    setState(() {
      sortOption = value;

      catsData.sort((a, b) {
        // Check if either item is pinned
        if (a.pinned! || b.pinned!) {
          if (a.pinned!) return -1;
          if (b.pinned!) return 1;
        }

        if (value == 'name') {
          return ascending
              ? a.name.compareTo(b.name)
              : b.name.compareTo(a.name);
        } else if (value == 'birthDate') {
          return ascending
              ? a.birthDate.compareTo(b.birthDate)
              : b.birthDate.compareTo(a.birthDate);
        } else if (value == 'sex') {
          return ascending ? a.sex.compareTo(b.sex) : b.sex.compareTo(a.sex);
        } else if (value == 'location') {
          if (a.location == null && b.location == null) {
            return 0;
          } else if (a.location == null) {
            return ascending ? 1 : -1;
          } else if (b.location == null) {
            return ascending ? -1 : 1;
          } else {
            return ascending
                ? a.location!.compareTo(b.location!)
                : b.location!.compareTo(a.location!);
          }
        } else if (value == 'shelterArriveDate' || sortOption == '_') {
          if (a.shelterArriveDate == null && b.shelterArriveDate == null) {
            return 0;
          } else if (a.shelterArriveDate == null) {
            return ascending ? 1 : -1;
          } else if (b.shelterArriveDate == null) {
            return ascending ? -1 : 1;
          } else {
            return ascending
                ? a.shelterArriveDate!.compareTo(b.shelterArriveDate!)
                : b.shelterArriveDate!.compareTo(a.shelterArriveDate!);
          }
        } else {
          return 0;
        }
      });
    });
  }

  /// Call BLoC SearchEvent to filter the cat list based on the search query
  void searchName(String query) {
    setState(() => searchQuery = query);
    context.read<CatsBloc>().add(SearchEvent(query));
  }

  /// Set Filters IDs and call BLoC FilterEvent to filter Cats List with following filters
  void filterCats(Set<int> ids) {
    setState(() {
      filtersID = ids;

      /// Load and filter adopted cats
      if (ids.contains(6) || ids.contains(8) && !adoptedLoaded) {
        context.read<CatsBloc>().add(AdoptedEvent(filtersID));
        adoptedLoaded = true;
      }
    });
    context.read<CatsBloc>().add(FilterEvent(filtersID));
  }

  /// Show or hide Filter Drawer
  void toggleFilterDrawer() {
    setState(() => filterOpen = !filterOpen);
  }
}
