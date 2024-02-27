import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'filter_button.dart';
import 'filter_option_wrap.dart';

class FilterMenu extends StatefulWidget {
  final Function(Set<int>) setFilters;
  final Function toggleFilterDrawer;
  final bool showAdopted;
  final bool filterActive;
  const FilterMenu({
    Key? key,
    required this.setFilters,
    required this.showAdopted,
    required this.toggleFilterDrawer,
    required this.filterActive,
  }) : super(key: key);

  @override
  State<FilterMenu> createState() => _FilterMenuState();
}

class _FilterMenuState extends State<FilterMenu> {
  Set<int> activeButtonIds = {1, 4, 7, 11, 21, 31, 41};

  void toggleButton(int id) {
    setState(() {
      // todo add fields
      //  31...39 => location
      //  soon 41...49 => color
      if (id >= 1 && id <= 3) {
        activeButtonIds.removeWhere((e) => e >= 1 && e <= 3);
      } else if (id >= 4 && id <= 5) {
        activeButtonIds.removeWhere((e) => e >= 4 && e <= 5);
      } else if (id >= 6 && id <= 8) {
        activeButtonIds.removeWhere((e) => e >= 6 && e <= 8);
      } else if (id >= 11 && id <= 19) {
        activeButtonIds.removeWhere((e) => e >= 11 && e <= 19);
      } else if (id >= 21 && id <= 29) {
        activeButtonIds.removeWhere((e) => e >= 21 && e <= 29);
      } else if (id >= 31 && id <= 39) {
        activeButtonIds.removeWhere((e) => e >= 31 && e <= 39);
      } else if (id >= 41 && id <= 49) {
        activeButtonIds.removeWhere((e) => e >= 41 && e <= 49);
      } else if (id == 0) {
        activeButtonIds.clear();
        activeButtonIds.addAll({1, 4, 7, 11, 21, 31, 41});
      }
      if (id != 0) {
        activeButtonIds.add(id);
      }
    });
    widget.setFilters(activeButtonIds);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 332,
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.filterActive)
                      CleanButton(id: 0, onToggle: toggleButton),
                    if (!widget.filterActive) const SizedBox(height: 28),
                    const SizedBox(height: 16),

                    /// SEX
                    FilterOptionWrap(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              WidgetSpan(child: Icon(Icons.male, size: 16)),
                              WidgetSpan(child: Icon(Icons.female, size: 16)),
                              // WidgetSpan(child: SizedBox(width: 4)),
                              // TextSpan(text: 'Стать'),
                              WidgetSpan(child: SizedBox(width: 4)),
                            ],
                          ),
                        ),
                        FilterButton(
                            id: 1,
                            label: AppLocalizations.of(context)!.all,
                            isActive: activeButtonIds.contains(1),
                            onToggle: toggleButton),
                        FilterButton(
                            id: 2,
                            label: AppLocalizations.of(context)!.cats_m,
                            isActive: activeButtonIds.contains(2),
                            onToggle: toggleButton),
                        FilterButton(
                            id: 3,
                            label: AppLocalizations.of(context)!.cats_f,
                            isActive: activeButtonIds.contains(3),
                            onToggle: toggleButton),
                      ],
                    ),

                    /// AGE
                    FilterOptionWrap(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              const WidgetSpan(
                                  child: Icon(Icons.cake_outlined, size: 16)),
                              const WidgetSpan(child: SizedBox(width: 4)),
                              TextSpan(
                                  text: AppLocalizations.of(context)!.age,
                                  style:
                                      const TextStyle(color: Colors.black87)),
                              const WidgetSpan(child: SizedBox(width: 4)),
                            ],
                          ),
                        ),
                        FilterButton(
                            id: 11,
                            label: AppLocalizations.of(context)!.all,
                            isActive: activeButtonIds.contains(11),
                            onToggle: toggleButton),
                        FilterButton(
                            id: 12,
                            label: AppLocalizations.of(context)!.under_year,
                            isActive: activeButtonIds.contains(12),
                            onToggle: toggleButton),
                        FilterButton(
                            id: 13,
                            label: AppLocalizations.of(context)!.one_four_years,
                            isActive: activeButtonIds.contains(13),
                            onToggle: toggleButton),
                        FilterButton(
                            id: 14,
                            label: AppLocalizations.of(context)!.four_ten_years,
                            isActive: activeButtonIds.contains(14),
                            onToggle: toggleButton),
                        FilterButton(
                            id: 15,
                            label:
                                AppLocalizations.of(context)!.older_ten_years,
                            isActive: activeButtonIds.contains(15),
                            onToggle: toggleButton),
                      ],
                    ),

                    /// TIME IN SHELTER
                    FilterOptionWrap(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              const WidgetSpan(
                                  child: Icon(Icons.calendar_today, size: 16)),
                              const WidgetSpan(child: SizedBox(width: 4)),
                              TextSpan(
                                  text: AppLocalizations.of(context)!
                                      .days_overstay,
                                  style:
                                      const TextStyle(color: Colors.black87)),
                              const WidgetSpan(child: SizedBox(width: 4)),
                            ],
                          ),
                        ),
                        FilterButton(
                            id: 21,
                            label: AppLocalizations.of(context)!.all,
                            isActive: activeButtonIds.contains(21),
                            onToggle: toggleButton),
                        FilterButton(
                          id: 22,
                          isActive: activeButtonIds.contains(22),
                          onToggle: toggleButton,
                          labelWidget: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                    child: Image.asset(
                                  'lib/assets/seedling.png',
                                  height: 18,
                                )),
                                TextSpan(
                                  text: AppLocalizations.of(context)!
                                      .under_one_month,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        FilterButton(
                          id: 23,
                          isActive: activeButtonIds.contains(23),
                          onToggle: toggleButton,
                          labelWidget: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                    child: Image.asset(
                                  'lib/assets/dove.png',
                                  height: 18,
                                )),
                                TextSpan(
                                  text: AppLocalizations.of(context)!
                                      .one_six_month,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        FilterButton(
                          id: 24,
                          isActive: activeButtonIds.contains(24),
                          onToggle: toggleButton,
                          labelWidget: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                    child: Image.asset(
                                  'lib/assets/folded_hands.png',
                                  height: 18,
                                )),
                                TextSpan(
                                  text: AppLocalizations.of(context)!
                                      .six_twelve_month,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        FilterButton(
                          id: 25,
                          isActive: activeButtonIds.contains(25),
                          onToggle: toggleButton,
                          labelWidget: RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                    child: Image.asset(
                                  'lib/assets/broken_heart.png',
                                  height: 18,
                                )),
                                TextSpan(
                                  text: AppLocalizations.of(context)!
                                      .more_than_year,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    /// FEATURES
                    FilterOptionWrap(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Icon(Icons.star_border, size: 16)),
                              WidgetSpan(child: SizedBox(width: 4)),
                            ],
                          ),
                        ),
                        FilterButton(
                            id: 4,
                            label: AppLocalizations.of(context)!.all,
                            isActive: activeButtonIds.contains(4),
                            onToggle: toggleButton),
                        FilterButton(
                            id: 5,
                            label: AppLocalizations.of(context)!.spec_pet,
                            isActive: activeButtonIds.contains(5),
                            onToggle: toggleButton),
                      ],
                    ),

                    /// ADOPTED FILTER
                    FilterOptionWrap(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Icon(Icons.home_outlined, size: 16)),
                              WidgetSpan(child: SizedBox(width: 4)),
                            ],
                          ),
                        ),
                        FilterButton(
                            id: 6,
                            label: AppLocalizations.of(context)!.all,
                            isActive: activeButtonIds.contains(6),
                            onToggle: toggleButton),
                        FilterButton(
                            id: 7,
                            label: AppLocalizations.of(context)!.in_search,
                            isActive: activeButtonIds.contains(7),
                            onToggle: toggleButton),
                        FilterButton(
                            id: 8,
                            label: AppLocalizations.of(context)!.found_home,
                            isActive: activeButtonIds.contains(8),
                            onToggle: toggleButton),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /// CLOSE BUTTON
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0, right: 10.0),
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Material(
                      color: Colors.white.withOpacity(0.4),
                      child: IconButton(
                        tooltip: AppLocalizations.of(context)!.hide_filter,
                        iconSize: 30,
                        color: Colors.black.withOpacity(0.6),
                        onPressed: () => widget.toggleFilterDrawer(),
                        icon: const Icon(Icons.close_rounded),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CleanButton extends StatefulWidget {
  final int id;
  final Function(int) onToggle;

  const CleanButton({
    Key? key,
    required this.id,
    required this.onToggle,
  }) : super(key: key);

  @override
  CleanButtonState createState() => CleanButtonState();
}

class CleanButtonState extends State<CleanButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onToggle(widget.id);
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.black26,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)!.clean,
            style: const TextStyle(color: Colors.white70),
          ),
          Icon(
            Icons.delete_outline,
            color: Colors.red.withOpacity(0.8),
            size: 16,
          ),
        ],
      ),
    );
  }
}
