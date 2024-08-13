import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color containerColor, borderColor, textColor;
  final String text;
  final double width, height;
  bool loading;
  CustomButton(
      {super.key,
      required this.onTap,
      required this.borderColor,
      required this.text,
      required this.height,
      required this.containerColor,
      required this.width,
      required this.textColor,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: containerColor.withOpacity(loading ? 0.5 : 1),
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
            border: Border.all(
                width: 1, color: borderColor.withOpacity(loading ? 0.5 : 1))),
        child: Center(
          child: loading
              ? SizedBox(
                  width: 16.w,
                  height: 16.w,
                  child: CircularProgressIndicator.adaptive(
                    strokeWidth: 2.w,
                  ),
                )
              : Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      color: textColor,
                      fontWeight: FontWeight.w500),
                ),
        ),
      ),
    );
  }
}
