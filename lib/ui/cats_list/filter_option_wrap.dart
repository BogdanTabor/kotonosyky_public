import 'package:flutter/material.dart';

class FilterOptionWrap extends StatelessWidget {
  final List<Widget> children;
  const FilterOptionWrap({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Wrap(
        runSpacing: 4.0,
        spacing: 4.0,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.start,
        children: children,
      ),
    );
  }
}
