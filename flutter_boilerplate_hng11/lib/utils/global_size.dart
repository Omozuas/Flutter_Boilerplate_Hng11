import 'package:flutter/material.dart';

class GlobalScreenSize {
  //getting the screen size
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  static double getDevicePixelRatio(BuildContext context) {
    return MediaQuery.devicePixelRatioOf(context);
  }
}
