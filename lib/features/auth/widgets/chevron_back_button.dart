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
        mainAxisAlignment: includeBottomSpace
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          if (includeBottomSpace) ...[
            SizedBox(
              height: 4.h,
            ),
          ],
          Icon(Icons.chevron_left, size: 30.sp),
          if (includeBottomSpace) ...[
            const SizedBox(
              height: 16,
            ),
          ],
        ],
      ),
    );
  }
}
