import 'package:flutter/material.dart';

class BottomGradientContainer extends StatelessWidget {
  final double? textHeight;

  const BottomGradientContainer({Key? key, this.textHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (textHeight != null) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double containerHeight = textHeight! * 1.8;
            if (containerHeight > constraints.maxHeight) {
              containerHeight = constraints.maxHeight;
            }
            return Container(
              height: containerHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [textHeight! * 0.7 / textHeight!, 1.0],
                  colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.transparent,
                  ],
                ),
              ),
            );
          },
        ),
      );
    } else {
      return Container();
    }
  }
}
