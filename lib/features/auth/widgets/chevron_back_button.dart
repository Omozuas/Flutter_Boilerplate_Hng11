import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChevronBackButton extends StatelessWidget {
  const ChevronBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.chevron_left, size: 30.sp),
      onPressed: () => Navigator.pop(context),
    );
  }
}
