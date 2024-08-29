import 'package:flutter/material.dart';
//import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/features/order/models/order.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key, required this.order, required this.onTap});

  final Order order;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.sp, right: 24.sp, top: 10.sp),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              width: 383.w,
              //width(context),
              height: 107.h,
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 10.h,
                bottom: 8.h,
              ),
              decoration: BoxDecoration(
                color: GlobalColors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: const Color(0xFFF7F7F7),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${context.orderNumberText} ${order.number}',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF71717A),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5.0.h),
                      Text(
                        '${order.deliveryDate}, ${order.deliveryTime}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/svg/product_listing/delivery.svg',
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: Text(
                          order.deliveryText,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: order.deliveryColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 16,
              bottom: 12.h,
              right: 20.w,
              left: 251.w,
              child: Container(
                width: 92.sp,
                height: 79.sp,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: const Color.fromRGBO(247, 247, 247, 1),
                  ),
                ),
                child: Image.asset(order.image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
