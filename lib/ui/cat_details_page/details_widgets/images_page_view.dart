import 'package:flutter/material.dart';

import 'image_item.dart';

class ImagesPageView extends StatelessWidget {
  final Function(RawKeyEvent) handleKeyboardNavigation;
  final Function(int?) onPageChanged;
  final PageController controller;
  final List<String>? images;
  const ImagesPageView(
      {Key? key,
      required this.handleKeyboardNavigation,
      required this.onPageChanged,
      required this.controller,
      this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: handleKeyboardNavigation,
      child: PageView.builder(
        clipBehavior: Clip.none,
        physics:
            const NeverScrollableScrollPhysics(), //const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics())
        controller: controller,
        onPageChanged: onPageChanged,
        itemCount: images?.length ?? 0,
        itemBuilder: (context, index) {
          return ImageItem(images: images, index: index);
        },
      ),
    );
  }
}
