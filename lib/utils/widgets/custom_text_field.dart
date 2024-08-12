import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;
  final TextEditingController controller;
  final EdgeInsets? padding;
  final String hintText;
  final TextStyle? hintTextStyle;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? borderRadius;
  final EdgeInsets? margin;
  final int? maxLines;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final Color? focusedBorderColor;

  const CustomTextField({
    super.key,
    required this.label,
    this.labelStyle,
    required this.controller,
    this.padding,
    required this.hintText,
    this.hintTextStyle,
    this.keyboardType,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.margin,
    this.borderRadius,
    this.maxLines,
    this.validator,
    this.borderColor,
    this.focusedBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: labelStyle ??
                const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0F172A),
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            maxLines: maxLines ?? 1,
            validator: validator,
            decoration: InputDecoration(
              contentPadding: padding ??
                  const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF94A3B8),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 6),
                borderSide: BorderSide(
                  color: GlobalColors.borderColor,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 6),
                borderSide: BorderSide(
                  color: borderColor ?? GlobalColors.borderColor,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 6),
                borderSide: BorderSide(
                  color: focusedBorderColor ?? GlobalColors.orange,
                  width: 1,
                ),
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}