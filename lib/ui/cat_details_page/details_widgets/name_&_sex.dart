import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NameAndSexWidget extends StatelessWidget {
  final IconData sexIcon;
  final String catName;
  final TextStyle style;
  final bool adopted;

  const NameAndSexWidget({
    super.key,
    required this.sexIcon,
    required this.catName,
    required this.style,
    required this.adopted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            sexIcon,
            color: sexIcon == Icons.male ? Colors.blue : Colors.pink,
            size: 36,
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              catName,
              style: style,
              maxLines: 2,
              overflow: TextOverflow.fade,
            ),
          ),
          if (adopted)
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(12, 2, 12, 4),
                decoration: BoxDecoration(
                  color: Colors.lightGreen.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: Text(
                  AppLocalizations.of(context)!.in_home,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
