import 'package:flutter/material.dart';

import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles {
  //textstyles for detail screen
  //  static final header = TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600,);
  // static final title = TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600,);
  // static final label = TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,);
  //definig my textstyles
  static TextStyle headerTextBlack = TextStyle(
      fontSize: 24.sp,
      color: GlobalColors.blackColor,
      fontWeight: FontWeight.w600);
  static TextStyle bannerHeaderTextWhite = TextStyle(
      fontSize: 20.sp, color: GlobalColors.white, fontWeight: FontWeight.w700);
  static TextStyle bannerbodyTextOrange = TextStyle(
      fontSize: 12.sp, color: GlobalColors.orange, fontWeight: FontWeight.w400);
  static TextStyle bannerbodyTextBlack = TextStyle(
      fontSize: 12.sp,
      color: GlobalColors.black200Color,
      fontWeight: FontWeight.w500); 
      static TextStyle bannerbodyTextBlack500 = TextStyle(
      fontSize: 12.sp,
      color: GlobalColors.black200Color,
      fontWeight: FontWeight.w400);
  static TextStyle bannerbodyTextBlack200 = TextStyle(
      fontSize: 12.sp,
      color: GlobalColors.mutedTextColor,
      fontWeight: FontWeight.w600); 
      static TextStyle bannerbodyTextBlack300 = TextStyle(
      fontSize: 12.sp,
      color: GlobalColors.mutedTextColor,
      fontWeight: FontWeight.w500);static TextStyle bannerbodyTextBlack400 = TextStyle(
      fontSize: 12.sp,
      color: GlobalColors.mutedTextColor,
      fontWeight: FontWeight.w400);
  static TextStyle bannerbodyTextgrey = TextStyle(
      fontSize: 12.sp, color: GlobalColors.grays, fontWeight: FontWeight.w400);
  static TextStyle bannerbodyTextBlack100 = TextStyle(
      fontSize: 12.sp, color: GlobalColors.black, fontWeight: FontWeight.w400);
  static TextStyle bannerbodyTextBlue100 = TextStyle(
      fontSize: 12.sp,
      color: GlobalColors.blueTextColor,
      fontWeight: FontWeight.w500);
  static TextStyle titleTextBlack = TextStyle(
      fontSize: 18.sp,
      color: GlobalColors.blackColor,
      fontWeight: FontWeight.w600);
  static TextStyle productTextTitleBlack = TextStyle(
      fontSize: 16.sp,
      color: GlobalColors.gray200Color,
      fontWeight: FontWeight.w500);
  static TextStyle productTextTitleMute = TextStyle(
      fontSize: 18.sp,
      color: GlobalColors.mutedTextColor,
      fontWeight: FontWeight.w500);
  static TextStyle productTextTitleBlue = TextStyle(
      fontSize: 18.sp,
      color: GlobalColors.blueTextColor,
      fontWeight: FontWeight.w500);
  static TextStyle productTextBodyBlack = TextStyle(
      fontSize: 14.sp,
      color: GlobalColors.gray300Color,
      fontWeight: FontWeight.w400);
  static TextStyle productTextBody2Black = TextStyle(
      fontSize: 16.sp,
      color: GlobalColors.black200Color,
      fontWeight: FontWeight.w700);
  static TextStyle productTextBody2Black100 = TextStyle(
      fontSize: 16.sp,
      color: GlobalColors.black300Color,
      fontWeight: FontWeight.w700);
  static TextStyle productTextBody3Black = TextStyle(
      fontSize: 14.sp,
      color: GlobalColors.gray400Color,
      fontWeight: FontWeight.w400);
  static TextStyle productTextBody4Black = TextStyle(
      fontSize: 14.sp,
      color: GlobalColors.gray500Color,
      fontWeight: FontWeight.w400);
  static TextStyle bodyTextOrange = TextStyle(
      fontSize: 14.sp, color: GlobalColors.orange, fontWeight: FontWeight.w400);

  static TextStyle producHeaderBlack = TextStyle(
      fontSize: 18.sp, color: GlobalColors.black, fontWeight: FontWeight.w700);
  static TextStyle productSmallBodyTextBlack = TextStyle(
      fontSize: 12.sp,
      color: GlobalColors.darkOne,
      fontWeight: FontWeight.w400);
  static TextStyle productSmallBodyTextMuted = TextStyle(
      fontSize: 12.sp,
      color: GlobalColors.mutedTextColor,
      fontWeight: FontWeight.w400);
}

class PlusJakartaTextStyle {
  static TextStyle headerText2 = TextStyle(
      fontSize: 16.sp,
      color: GlobalColors.black,
      fontFamily: GoogleFonts.plusJakartaSans.toString(),
      fontWeight: FontWeight.w700);
  static TextStyle bodyTextGrey = TextStyle(
      fontSize: 14.sp,
      color: GlobalColors.gray600Color,
      fontFamily: GoogleFonts.plusJakartaSans.toString(),
      fontWeight: FontWeight.w400);
}
