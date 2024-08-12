import 'package:flutter/material.dart';

class SocialMediaInput extends StatelessWidget {
  final TextEditingController controller;
  final EdgeInsets? padding;
  final String hintText;
  final TextStyle? hintTextStyle;
  final TextInputType? keyboardType;
  final Widget prefixIcon;
  final double? borderRadius;
  final EdgeInsets? margin;
  final int? maxLines;

  const SocialMediaInput({
    super.key,
    required this.controller,
    this.padding,
    required this.hintText,
    this.hintTextStyle,
    this.keyboardType,
    required this.prefixIcon,
    this.margin,
    this.borderRadius,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          contentPadding: padding ??
              const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
          hintText: hintText,
          hintStyle: hintTextStyle ??
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF94A3B8),
              ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
            borderSide: const BorderSide(
              color: Color(0xFFCBD5E1),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
            borderSide: const BorderSide(
              color: Color(0xFFCBD5E1),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
            borderSide: const BorderSide(
              color: Color(0xFFCBD5E1),
              width: 1,
            ),
          ),
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
