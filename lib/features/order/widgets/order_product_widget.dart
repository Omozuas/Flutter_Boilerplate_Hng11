import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/features/cart/widgets/price_text_widget.dart';
import 'package:flutter_boilerplate_hng11/features/order/screens/order_detail_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/global_colors.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    super.key,
    required this.price,
    required this.quantity,
    required this.isLast,
    required this.name,
    required this.image,
    required this.description,
    required this.orderStatus,
    required this.orderBy,
  });

  final String name;
  final String image;
  final String description;
  final num price;
  final int quantity;
  final bool isLast;
  final String orderStatus;
  final String orderBy;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.h.sbH,
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderDetailScreen(
                name: name,
                image: image,
                price: price,
              ),
            ),
          ),
          child: SizedBox(
            height: 131.sp,
            width: width(context),
            child: Row(
              children: [
                Container(
                  // height: 50.sp,
                  // width: 50.sp,
                  height: 131.sp,
                  width: 173.sp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(image),
                          fit: BoxFit.cover)),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Container(
                      //   margin: 16.sp.padA,
                      //   padding: 6.sp.padA,
                      //   decoration: ShapeDecoration(
                      //     color: const Color(0xFFFAFAFA),
                      //     shape: RoundedRectangleBorder(
                      //       side: const BorderSide(
                      //           width: 1, color: Color(0xFF525252)),
                      //       borderRadius: BorderRadius.circular(4),
                      //     ),
                      //   ),
                      //   child: Text(
                      //     orderStatus,
                      //     style: TextStyle(
                      //         color: GlobalColors.orange,
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                17.w.sbW,
                Expanded(
                  child: Padding(
                    padding: 10.h.padV,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Order From $orderBy",
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: GlobalColors.orange,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  5.h.sbH,
                                  Text(
                                    name,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: const Color(0xFF0A0A0A),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  5.h.sbH,
                                  Text(description,
                                      maxLines: 2,
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 12.sp,
                                        color: const Color(0xFF6E7079),
                                      ))
                                ],
                              ),
                            ),
                            10.sp.sbW,
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: PriceWidget(
                                value: price,
                                isBold: true,
                                size: 16.sp,
                              ),
                            ),
                            Text(
                              "Quantity: $quantity",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12.sp,
                                color: const Color(0xFF6E7079),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        16.h.sbH,
        isLast
            ? 0.0.sbH
            : Divider(
                color: const Color(0xFFDEDEDE),
                height: 1.h,
              ),
      ],
    );
  }
}
