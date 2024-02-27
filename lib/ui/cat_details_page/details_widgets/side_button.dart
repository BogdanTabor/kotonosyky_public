import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideButton extends StatelessWidget {
  final Widget? child;
  final IconData? iconData;
  final Function onPressed;

  const SideButton({
    Key? key,
    this.child,
    this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28.0),
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
        child: Column(
          children: [
            if (iconData != null)
              IconButton(
                onPressed: () => onPressed(),
                iconSize: 36.0,
                icon: FaIcon(iconData),
              ),
            if (child != null)
              InkWell(
                onTap: () => onPressed(),
                child: child!,
              )
          ],
        ),
      ),
    );
  }
}
