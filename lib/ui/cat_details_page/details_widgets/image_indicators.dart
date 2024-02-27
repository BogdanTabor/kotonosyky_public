import 'package:flutter/material.dart';

class ImageIndicators extends StatelessWidget {
  final int currentIndex;
  final int numberOfIndicators;
  final PageController controller;

  const ImageIndicators({
    super.key,
    required this.currentIndex,
    required this.numberOfIndicators,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (numberOfIndicators == 0) {
      return Container();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int index = 0; index < numberOfIndicators; index++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: CircleAvatar(
                backgroundColor: index == currentIndex
                    ? Colors.blue // selected image
                    : Colors.white.withOpacity(0.8), // unselected image
                radius: 5,
              ),
            ),
          ),
      ],
    );
  }
}
