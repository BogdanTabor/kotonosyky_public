import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DaysInShelterWidget extends StatelessWidget {
  final String name;
  final String days;
  final bool adopted;
  final bool male;
  const DaysInShelterWidget({
    super.key,
    required this.male,
    required this.name,
    required this.days,
    this.adopted = false,
  });

  @override
  Widget build(BuildContext context) {
    String adoptedMessage = male
        ? '$name ${AppLocalizations.of(context)!.searched_m} $days'
        : '$name ${AppLocalizations.of(context)!.searched_f} $days';
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Image.asset(
                    adopted
                        ? 'lib/assets/house_with_garden.png'
                        : 'lib/assets/calendar.png',
                    height: 32,
                  ),
                  const SizedBox(height: 18),
                  Text(
                    adopted
                        ? adoptedMessage
                        : '$name ${AppLocalizations.of(context)!.search_family} $days',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close_rounded)),
        )
      ],
    );
  }
}
