import 'package:flutter/material.dart';

class GridItemLabel extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final double iconSize;
  final double fontSize;
  final MainAxisSize mainAxisSize;

  const GridItemLabel({
    super.key,
    required this.icon,
    required this.label,
    this.mainAxisSize = MainAxisSize.min,
    this.iconColor = Colors.black87,
    this.fontSize = 12.0,
    this.iconSize = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: mainAxisSize,
      children: [
        Text.rich(
          TextSpan(children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Icon(
                icon,
                size: iconSize,
                color: iconColor,
              ),
            ),
            const WidgetSpan(child: SizedBox(width: 2)),
            TextSpan(
              text: label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.black87,
                    fontSize: fontSize,
                  ),
            ),
          ]),
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }
}
