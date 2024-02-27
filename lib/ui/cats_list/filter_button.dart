import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  final int id;
  final String? label;
  final bool isActive;
  final Function(int) onToggle;
  final Widget? labelWidget;

  const FilterButton({
    Key? key,
    required this.id,
    this.label,
    required this.isActive,
    required this.onToggle,
    this.labelWidget,
  }) : super(key: key);

  @override
  FilterButtonState createState() => FilterButtonState();
}

class FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onToggle(widget.id);
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor:
            widget.isActive ? Colors.green : Colors.grey.withOpacity(0.7),
      ),
      child: widget.labelWidget ??
          Text(
            widget.label ?? '',
            style: const TextStyle(color: Colors.white),
          ),
    );
  }
}
