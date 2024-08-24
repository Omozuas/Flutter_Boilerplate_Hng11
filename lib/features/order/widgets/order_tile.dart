import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/order/models/order.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 107.0,
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 11.0,
                top: 10.0,
                bottom: 8.0,
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
                        'Order#: ${order.number}',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF71717A),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        '${order.deliveryDate}, ${order.deliveryTime}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          'assets/images/svg/product_listing/delivery.svg'),
                      SizedBox(width: 6.w),
                      Text(
                        order.deliveryText,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: order.deliveryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 16.0,
              right: 20.0,
              child: Container(
                width: 92.0,
                height: 79.0,
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
