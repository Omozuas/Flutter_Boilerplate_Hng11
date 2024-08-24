import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/string_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../notification/widgets/profile_picture_notification.dart';

class CustomerListTile extends StatelessWidget {
  final String customerName;
  final String email;
  final num amount;

  const CustomerListTile({
    super.key,
    required this.customerName,
    required this.email,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            const NotificationProfilePicture(
              forHome: true,
            ),
            CircleAvatar(
              backgroundImage: const AssetImage('assets/images/logo.png'),
              radius: 24.w,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customerName,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              formatNumber(amount, decimalPlaces: 2),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
