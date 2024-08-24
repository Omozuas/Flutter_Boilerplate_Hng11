import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/widgets/shimmer_loaders.dart';
import '../../cart/utils/widget_extensions.dart';

class LoadingNotificationListView extends StatelessWidget {
  const LoadingNotificationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (_, index) {
          return Container(
            height: 48.h,
            margin: 8.h.padV,
            width: width(context),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: const ShimmerCard()),
          );
        });
  }
}
