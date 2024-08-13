import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final VoidCallback onTap;
  final Color containerColor, borderColor, textColor;
  final String text;
  final double width, height;
  const Custombutton({
    super.key,
    required this.onTap,
    required this.borderColor,
    required this.text,
    required this.height,
    required this.containerColor,
    required this.width,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: containerColor,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
            border: Border.all(width: 1, color: borderColor)),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14, color: textColor, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
