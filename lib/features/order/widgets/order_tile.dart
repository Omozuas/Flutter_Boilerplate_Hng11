import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/models/cart_model.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/features/order/screens/order_detail_screen.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.product,
    required this.price,
    required this.userData,
    required this.quantity,
  });

  final CartData product;
  final num price;
  final String userData;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        top: 16.0,
        right: 8.0,
      ),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailScreen(
              // name: 'name',
              name: product.name ?? '',
              // image: '',
              image: product.image ?? '',
              price: price,
            ),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: 100.h,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 70.sp,
                  width: 70.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: DecorationImage(
                        // image: CachedNetworkImageProvider(''),
                        image: CachedNetworkImageProvider(product.image ?? ''),
                        fit: BoxFit.cover),
                  ),
                ),
                15.w.sbW,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Ensure center alignment
                    children: [
                      Text(
                        "Order From $userData",
                        maxLines: 1,
                        style: TextStyle(
                          color: GlobalColors.orange,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          // height: 0,
                        ),
                      ),
                      5.h.sbH,
                      Text(
                        // 'hhh',
                        product.name ?? '',
                        maxLines: 1,
                        style: TextStyle(
                          color: const Color(0xFF0A0A0A),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      5.h.sbH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${price.toStringAsFixed(2)}",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
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
                      // Text(
                      //   "Order time: 12:56 pm",
                      //   style: GoogleFonts.plusJakartaSans(
                      //     fontSize: 12.sp,
                      //     color: const Color(0xFF6E7079),
                      //     height: 0,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
