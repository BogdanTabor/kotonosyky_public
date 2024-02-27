import 'package:flutter/material.dart';

class CornerMark extends StatelessWidget {
  final String assetName;

  const CornerMark({super.key, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.black.withOpacity(0.3), Colors.transparent],
            stops: const [0.1, 0.5],
            center: Alignment.center,
            radius: 1,
          ),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(
            'lib/assets/$assetName.png',
            height: 24,
          ),
        ),
      ),
    );
  }
}
