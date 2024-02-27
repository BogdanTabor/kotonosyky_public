import 'package:flutter/material.dart';

import '../../../utilities/date_utils.dart';

class AgeAndLocationWidget extends StatelessWidget {
  final String? location;
  final DateTime birthDate;
  final TextStyle style;
  const AgeAndLocationWidget(
      {Key? key,
      required this.location,
      required this.birthDate,
      required this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const Icon(Icons.cake_rounded, size: 18),
              const SizedBox(width: 6),
              Text(
                DateUtilities.calculateAge(context, birthDate),
                style: style,
              ),
            ],
          ),
          const SizedBox(width: 24),
          if (location != null && location != '')
            const Icon(Icons.location_on, size: 18),
          const SizedBox(width: 4),
          if (location != null)
            Text(
              location!,
              style: style,
            ),
        ],
      ),
    );
  }
}
