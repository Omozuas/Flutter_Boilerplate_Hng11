import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChevronBackButton extends StatelessWidget {
  const ChevronBackButton({
    super.key,
    this.onBack,
    this.includeBottomSpace = false,
  });
  final VoidCallback? onBack;
  final bool includeBottomSpace;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onBack,
      child: Column(
        children: [
          SizedBox(
            height: 6.h,
          ),
          InkWell(
            onTap: onBack,
            child: Icon(Icons.chevron_left, size: 30.sp),
          ),
          if (includeBottomSpace) ...[
            const SizedBox(
              height: 18,
            ),
          ],
        ],
      ),
    );
  }
}
