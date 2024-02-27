import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../bloc/cat_page_bloc.dart';
import '../../objects/cat.dart';
import 'cat_grid_item.dart';
import 'items_toolbar.dart';

class CatsList extends StatefulWidget {
  final PageController pageController;
  final Function setData;
  final Function searchName;
  final Function toggleFilterDrawer;
  final Function toggleSortOrder;
  final String? sortOption;
  final String searchQuery;
  final int filtersLength;

  const CatsList({
    Key? key,
    required this.pageController,
    required this.setData,
    required this.sortOption,
    required this.toggleSortOrder,
    required this.searchName,
    required this.toggleFilterDrawer,
    required this.filtersLength,
    required this.searchQuery,
  }) : super(key: key);

  @override
  State<CatsList> createState() => _CatsListState();
}

class _CatsListState extends State<CatsList>
    with AutomaticKeepAliveClientMixin {
  late List<Cat> cats = [];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final screen = MediaQuery.of(context).size;
    return BlocConsumer<CatsBloc, CatsState>(
      listener: (context, state) {},
      builder: (context, state) {
        void loadMore() {
          context.read<CatsBloc>().add(const LoadMoreEvent());
        }

        if (state is LoadingCatsState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CatsLoadedState) {
          cats = state.cats;

          return Stack(
            children: [
              ListView(
                children: [
                  const SizedBox(height: 48),
                  if (state.cats.isEmpty)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          '${AppLocalizations.of(context)!.not_found_request} "${widget.searchQuery}"',
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                  if (state.cats.isNotEmpty)
                    Center(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final isSmallScreen = screen.width < 495;
                          return Container(
                            constraints: const BoxConstraints(maxWidth: 500),
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 208),
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: isSmallScreen ? 2 : 3,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: isSmallScreen ? 1 / 1 : 0.9,
                              ),
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: state.moreAvailable
                                  ? cats.length + 1
                                  : cats.length,
                              itemBuilder: (context, index) {
                                if (index < cats.length) {
                                  return CatGridItem(
                                    cat: cats[index],
                                    sortOption: widget.sortOption ?? 'name',
                                    onTap: () {
                                      widget.setData(
                                          cats[index].id, state.cats);
                                    },
                                  );
                                } else {
                                  return LoadMoreButton(
                                    onTap: () => loadMore(),
                                  );
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),

              /// ITEMS TOOLBAR
              ItemsToolbar(
                filterItemsCount: widget.filtersLength,
                sortingOption: widget.sortOption ?? '_',
                onFilter: () => widget.toggleFilterDrawer(),
                onSearch: (query) {
                  widget.searchName(query);
                },
                onSort: (value, asc) => widget.toggleSortOrder(value, asc),
              ),
            ],
          );
        } else {
          return Center(child: Text(AppLocalizations.of(context)!.error));
        }
      },
    );
  }

  @override
  void dispose() => super.dispose();
}

class LoadMoreButton extends StatelessWidget {
  final Function onTap;

  const LoadMoreButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.pets,
            size: 18,
            color: Colors.grey,
          ),
          const SizedBox(height: 10),
          Text(
            AppLocalizations.of(context)!.more_cats,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
