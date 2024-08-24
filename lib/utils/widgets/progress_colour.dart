import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../global_size.dart';

class CustomProgressBar {
  Widget linearProgressBar(
      {BuildContext? context,
      Color? color,
      double? rightBottomPadding = 0,
      double? leftTopPadding = 0,
      double? rightTopPadding = 0,
      double? leftBottomPadding = 0}) {
    return Container(
      height: GlobalScreenSize.getScreenHeight(context!) * 0.006,
      width: GlobalScreenSize.getScreenWidth(context) * 0.156,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(leftBottomPadding!.r),
              topRight: Radius.circular(rightTopPadding!.r),
              bottomRight: Radius.circular(rightBottomPadding!.r),
              topLeft: Radius.circular(leftTopPadding!.r))),
    );
  }
}
