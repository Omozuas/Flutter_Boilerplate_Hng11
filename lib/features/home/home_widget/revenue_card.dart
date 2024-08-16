import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/global_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RevenueCard extends StatelessWidget {
  final String title;
  final String value;
  final String percentageChange;

  const RevenueCard({
    super.key,
    required this.title,
    required this.value,
    required this.percentageChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFF7F7F7)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: GlobalColors.gray500Color),
              ),
              const SizedBox(width: 15),
              const Text('\$',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          SizedBox(
            height: GlobalScreenSize.getScreenHeight(context) * 0.025,
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: GlobalColors.blackColor,
            ),
          ),
          SizedBox(
            height: GlobalScreenSize.getScreenHeight(context) * 0.008,
          ),
          Text(
            percentageChange,
            style: TextStyle(
                fontSize: 12.sp,
                color: percentageChange.startsWith('+')
                    ? Colors.green
                    : Colors.red),
          ),
        ],
      ),
    );
  }
}
