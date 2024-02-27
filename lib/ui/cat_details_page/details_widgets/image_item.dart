import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  final List<String>? images;
  final int index;

  const ImageItem({Key? key, required this.images, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Align(
        alignment: Alignment.center,
        child: Image.network(
          images![index],
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
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.pets),
        ),
      ),
    );
  }
}
