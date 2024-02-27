import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  final List<double> alignmentPosition;

  const NavigationButton({
    super.key,
    required this.onPressed,
    required this.iconData,
    this.alignmentPosition = const [0.95, -0.95],
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Align(
          alignment: Alignment(alignmentPosition[0], alignmentPosition[1]),
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.black.withOpacity(0.2), Colors.transparent],
                stops: const [0.1, 0.5],
                center: Alignment.center,
                radius: 1,
              ),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: const EdgeInsets.all(20),
              onPressed: onPressed,
              iconSize: 34,
              icon: Icon(
                iconData,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
