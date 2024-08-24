import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<String> items;
  final String? initialValue;
  final String placeholder; // initial text for the dropdown
  final Function(String?)? onChanged;
  final Color containerColor, borderColor, textColor;
  final double width, height;
  final double? borderRadius;
  final EdgeInsets? textPadding;
  final TextStyle? valueStyle;

  const CustomDropdownButton({
    super.key,
    required this.items,
    this.initialValue,
    this.placeholder = "Select", // initial text for the dropdown
    this.onChanged,
    required this.borderColor,
    required this.height,
    required this.containerColor,
    required this.width,
    required this.textColor,
    this.valueStyle,
    this.textPadding,
    this.borderRadius,
  });

  @override
  CustomDropdownButtonState createState() => CustomDropdownButtonState();
}

class CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.containerColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius ?? 6),
          ),
          border: Border.all(width: 1, color: widget.borderColor),
        ),
        child: DropdownButtonHideUnderline(
          child: Padding(
            padding: widget.textPadding ?? EdgeInsets.zero,
            child: DropdownButton<String>(
              style: widget.valueStyle,
              value: _selectedItem,
              hint: Text(
                widget.placeholder,
                style: TextStyle(color: widget.textColor),
              ),
              dropdownColor: widget.containerColor,
              icon: Icon(Icons.keyboard_arrow_down, color: widget.textColor),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(newValue);
                }
              },
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: widget.textColor),
                  ),
                );
              }).toList(),
              isExpanded:
                  true, // this makes dropdown expand to fill container width
            ),
          ),
        ),
      ),
    );
  }
}
