import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownButtonFormField extends StatefulWidget {
  final List<String> items;
  final String? initialValue;
  final String placeholder; // initial text for the dropdown
  final Function(String?)? onChanged;
  final Color containerColor, borderColor, textColor;
  final double? borderRadius;
  final EdgeInsets? textPadding;
  final TextStyle? valueStyle;
  final String? Function(String?)? validator;

  const CustomDropdownButtonFormField(
      {super.key,
      required this.items,
      this.initialValue,
      this.placeholder = "Select", // initial text for the dropdown
      this.onChanged,
      required this.borderColor,
      required this.containerColor,
      required this.textColor,
      this.valueStyle,
      this.textPadding,
      this.borderRadius,
      this.validator});

  @override
  CustomDropdownButtonFormFieldState createState() =>
      CustomDropdownButtonFormFieldState();
}

class CustomDropdownButtonFormFieldState
    extends State<CustomDropdownButtonFormField> {
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: widget.validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 6.r),
          borderSide: BorderSide(
            color: GlobalColors.borderColor,
            width: 1.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 6.r),
          borderSide: BorderSide(
            color: GlobalColors.orange,
            width: 1.w,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 6.r),
          borderSide: BorderSide(
            color: GlobalColors.borderColor,
            width: 1.w,
          ),
        ),
      ),
      style: widget.valueStyle,
      value: _selectedItem,
      hint: Text(
        widget.placeholder,
        softWrap: true,
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
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            value,
            style: TextStyle(color: widget.textColor),
          ),
        );
      }).toList(),
      isExpanded: true, // this makes dropdown expand to fill container width
    );
  }
}
