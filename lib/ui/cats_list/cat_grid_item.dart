import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kotonosyky/ui/cats_list/corner_mark.dart';

import '../../objects/cat.dart';
import '../../utilities/date_utils.dart';
import 'grid_item_label.dart';

class CatGridItem extends StatelessWidget {
  final Cat cat;
  final String? sortOption;
  final Function onTap;

  const CatGridItem({
    Key? key,
    required this.cat,
    this.sortOption,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData catSex = cat.sex == 'котик' ? Icons.male : Icons.female;
    Color sexColor = catSex == Icons.male ? Colors.blue : Colors.pink;

    return InkWell(
      onTap: () => onTap(),
      child: Stack(
        children: [
          if (cat.imagesUrls != null && cat.imagesUrls!.isNotEmpty)
            Align(
              alignment: Alignment.center,
              child: Image.network(
                cat.imagesUrls![0],
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  );
                },
                fit: BoxFit.cover,
                width: 400,
                height: 500,
                semanticLabel: cat.name,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.pets),
              ),
            )
          else
            const Align(
              alignment: Alignment.center,
              child: Icon(Icons.pets),
            ),
          Align(
            alignment: const Alignment(-1.01, 1.01),
            // alignment: Alignment.bottomCenter,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                        ),
                        child: Wrap(
                          runSpacing: 4.0,
                          spacing: 8.0,
                          alignment: WrapAlignment.spaceBetween,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runAlignment: WrapAlignment.end,
                          children: [
                            /// SEX & NAME
                            GridItemLabel(
                              icon: catSex,
                              iconColor: sexColor,
                              iconSize: 18.0,
                              label: cat.name,
                              fontSize: 14.0,
                              mainAxisSize: MainAxisSize.max,
                            ),

                            /// AGE
                            GridItemLabel(
                              icon: Icons.cake_outlined,
                              label: DateUtilities.calculateAge(
                                  context, cat.birthDate),
                            ),

                            /// SHELTER DAYS
                            if (sortOption == 'shelterArriveDate' &&
                                !cat.adopted!)
                              GridItemLabel(
                                icon: Icons.calendar_today,
                                iconSize: 11.0,
                                label: DateUtilities.calculateDays(
                                    context, cat.shelterArriveDate),
                              ),

                            /// ADOPTED DAYS
                            if (sortOption == 'shelterArriveDate' &&
                                cat.adoptionDate != null)
                              GridItemLabel(
                                icon: Icons.home_outlined,
                                label: DateUtilities.calculateDays(
                                    context, cat.shelterArriveDate,
                                    endDate: cat.adoptionDate),
                              ),

                            /// LOCATION
                            if (sortOption == 'location' &&
                                cat.location != null)
                              GridItemLabel(
                                icon: Icons.location_on_outlined,
                                label: cat.location ?? '',
                                mainAxisSize: MainAxisSize.max,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (cat.pinned != null && cat.pinned!)
            const CornerMark(assetName: 'pushpin'),
          if (cat.adopted != null && cat.adopted!)
            const CornerMark(assetName: 'house_with_garden'),
        ],
      ),
    );
  }
}
