import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//TODO: uncomment if using a pdf functionality
// import 'package:pdf/pdf.dart';

const ext = 0;

extension WidgetExtensions on double {
  Widget get sbH => SizedBox(
        height: h,
      );

  Widget get sbW => SizedBox(
        width: w,
      );

  Widget get sbHW => SizedBox(
        width: w,
        height: h,
  );

  EdgeInsetsGeometry get padA => EdgeInsets.all(this);

  EdgeInsetsGeometry get padV => EdgeInsets.symmetric(vertical: h);
  EdgeInsetsGeometry get padT => EdgeInsets.only(top: h);
  EdgeInsetsGeometry get padL => EdgeInsets.only(left: h);
  EdgeInsetsGeometry get padR => EdgeInsets.only(right: h);
  EdgeInsetsGeometry get padB => EdgeInsets.only(bottom: h);

  EdgeInsetsGeometry get padH => EdgeInsets.symmetric(horizontal: w);
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
