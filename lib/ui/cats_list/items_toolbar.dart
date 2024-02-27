import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ItemsToolbar extends StatefulWidget {
  final Function onFilter;
  final Function onSort;
  final Function onSearch;
  final String? sortingOption;
  final int? filterItemsCount;

  const ItemsToolbar({
    super.key,
    required this.onFilter,
    required this.onSort,
    required this.onSearch,
    required this.sortingOption,
    required this.filterItemsCount,
  });

  @override
  State<ItemsToolbar> createState() => _ItemsToolbarState();
}

class _ItemsToolbarState extends State<ItemsToolbar>
    with TickerProviderStateMixin {
  bool isAscending = true;
  bool filterVisible = false;
  bool sortVisible = false;
  bool searchVisible = false;
  late FocusNode searchFocus;
  late TextEditingController searchController;

  String _selectedSortItem = 'name';
  void selectSortItem(item) => setState(() => _selectedSortItem = item);

  @override
  void initState() {
    super.initState();
    searchFocus = FocusNode();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            color: Colors.white24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// FILTER BUTTON
                Stack(
                  children: [
                    IconButton(
                      tooltip: filterVisible
                          ? AppLocalizations.of(context)!.hide_filter
                          : AppLocalizations.of(context)!.filter,
                      splashRadius: 20,
                      onPressed: () {
                        widget.onFilter();
                        setState(() => filterVisible = !filterVisible);
                      },
                      icon: const Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.black87,
                      ),
                    ),
                    if (widget.filterItemsCount! > 0)
                      Positioned(
                        top: 3,
                        right: 3,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Text(
                            widget.filterItemsCount.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                  ],
                ),

                /// SORT BUTTON
                Row(
                  children: [
                    IconButton(
                      tooltip: sortVisible
                          ? AppLocalizations.of(context)!.hide_sort
                          : AppLocalizations.of(context)!.sort,
                      splashRadius: 20,
                      onPressed: () {
                        setState(() => sortVisible = !sortVisible);
                      },
                      icon: const Icon(
                        Icons.sort,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

                /// SORT DROPDOWN
                if (sortVisible)
                  IconButton(
                    iconSize: 20,
                    tooltip: AppLocalizations.of(context)!.change_direction,
                    splashRadius: 20,
                    onPressed: () {
                      setState(() {
                        isAscending = !isAscending;
                        widget.onSort(_selectedSortItem, isAscending);
                      });
                    },
                    icon: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationX(isAscending ? 0 : 3.14159)
                        ..rotateY(isAscending ? 0 : 3.14159),
                      child: const Icon(
                        Icons.sort_by_alpha_rounded,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                if (sortVisible)
                  Theme(
                    data: ThemeData(focusColor: Colors.transparent),
                    child: DropdownButton<String>(
                      value: widget.sortingOption,
                      onChanged: (newValue) {
                        widget.onSort(newValue, isAscending);
                        setState(() => selectSortItem(newValue!));
                      },
                      underline: const SizedBox(),
                      style: const TextStyle(
                        color: Colors.black87,
                      ),
                      items: [
                        DropdownMenuItem(
                          value: '_',
                          child: Text(AppLocalizations.of(context)!.sort),
                        ),
                        DropdownMenuItem(
                            value: 'name',
                            child: Row(children: [
                              const Icon(Icons.badge_outlined, size: 16),
                              const SizedBox(width: 4),
                              Text(AppLocalizations.of(context)!.name),
                            ])),
                        DropdownMenuItem(
                            value: 'birthDate',
                            child: Row(children: [
                              const Icon(Icons.cake_outlined, size: 16),
                              const SizedBox(width: 4),
                              Text(AppLocalizations.of(context)!.age),
                            ])),
                        DropdownMenuItem(
                            value: 'location',
                            child: Row(children: [
                              const Icon(Icons.location_on_outlined, size: 16),
                              const SizedBox(width: 4),
                              Text(AppLocalizations.of(context)!.location),
                            ])),
                        DropdownMenuItem(
                            value: 'shelterArriveDate',
                            child: Row(children: [
                              const Icon(Icons.calendar_today, size: 15),
                              const SizedBox(width: 4),
                              Text(AppLocalizations.of(context)!.shelter_days),
                            ])),
                      ],
                    ),
                  ),
                const Spacer(),

                /// SEARCH BUTTON
                Stack(
                  children: [
                    IconButton(
                      tooltip: searchVisible
                          ? AppLocalizations.of(context)!.hide_search
                          : AppLocalizations.of(context)!.search,
                      splashRadius: 20,
                      onPressed: () {
                        setState(() {
                          searchVisible = !searchVisible;
                          searchVisible
                              ? searchFocus.requestFocus()
                              : searchFocus.unfocus();
                        });
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black87,
                      ),
                    ),
                    if (searchController.text.isNotEmpty)
                      Positioned(
                        top: 1,
                        right: 6,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: const Text(''),
                        ),
                      ),
                  ],
                ),

                /// SEARCH FIELD
                if (searchVisible)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 4),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: searchController,
                                focusNode: searchFocus,
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 15),
                                decoration: InputDecoration(
                                  hintText:
                                      AppLocalizations.of(context)!.name_search,
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(8, 2, 4, 16),
                                  border: InputBorder.none,
                                  hintStyle: const TextStyle(
                                      color: Colors.black54, fontSize: 14),
                                ),
                                onChanged: (value) {
                                  widget.onSearch(value);
                                },
                              ),
                            ),
                            if (searchController.text.isNotEmpty)
                              Center(
                                child: IconButton(
                                  iconSize: 16,
                                  tooltip: AppLocalizations.of(context)!.clean,
                                  splashRadius: 10,
                                  icon: const Icon(Icons.clear,
                                      color: Colors.black38),
                                  onPressed: () {
                                    searchController.clear();
                                    widget.onSearch('');
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
