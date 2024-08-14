import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//CustomTextStyle.regular(fontSize: 16),
//CustomTextStyle.regular(color: GlobalColors.borderColor),

class CustomTextStyle {
  static const String fontFamily = 'Inter';
  static const Color defaultColor = Color(0xFF828282);
  static double defaultFontSize = 13.sp;

  static TextStyle thin({Color? color, double? fontSize}) {
    return TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize ?? defaultFontSize,
        color: color ?? defaultColor,
        fontWeight: FontWeight.w100);
  }

  static TextStyle extraLight({Color? color, double? fontSize}) {
    return TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize ?? defaultFontSize,
        color: color ?? defaultColor,
        fontWeight: FontWeight.w200);
  }

  static TextStyle light({Color? color, double? fontSize}) {
    return TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize ?? defaultFontSize,
        color: color ?? defaultColor,
        fontWeight: FontWeight.w300);
  }

  static TextStyle regular({Color? color, double? fontSize}) {
    return TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize ?? defaultFontSize,
        color: color ?? defaultColor,
        fontWeight: FontWeight.w400);
  }

  static TextStyle medium({Color? color, double? fontSize}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? defaultFontSize,
      fontWeight: FontWeight.w500,
      color: color ?? defaultColor,
    );
  }

  static TextStyle semiBold({Color? color, double? fontSize}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? defaultFontSize,
      fontWeight: FontWeight.w600,
      color: color ?? defaultColor,
    );
  }

  static TextStyle bold({Color? color, double? fontSize}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? defaultFontSize,
      fontWeight: FontWeight.w700,
      color: color ?? defaultColor,
    );
  }

  static TextStyle extraBold({Color? color, double? fontSize}) {
    return TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize ?? defaultFontSize,
        color: color ?? defaultColor,
        fontWeight: FontWeight.w800);
  }

  static TextStyle black({Color? color, double? fontSize}) {
    return TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize ?? defaultFontSize,
        color: color ?? defaultColor,
        fontWeight: FontWeight.w900);
  }
}
