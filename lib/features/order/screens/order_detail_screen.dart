import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({
    super.key, required this.order,
    // required this.name,
    // required this.image,
    // required this.price,
  });

  final Order order;
  // final String image;
  // final num price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.simpleTitle(
        titleText: context.orderDetails,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.h.sbH,
            Container(
              width: double.infinity,
              height: 300.h,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(order.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            20.h.sbH,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.deliveryText,
                  style:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
                ),
                // Text(
                //   '\$${order.toStringAsFixed(2)}',
                //   style: const TextStyle(
                //       fontSize: 20.0, fontWeight: FontWeight.w600),
                // ),
              ],
            ),
            10.h.sbH,
            const Divider(),
            const Text(
              'Order information',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
            10.h.sbH,
            const Text(
              'Ordered by: Tony Stark',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            4.h.sbH,
            const Text(
              'Quantity: 1',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            4.h.sbH,
            const Text(
              'Date ordered: 17th August 2024',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            4.h.sbH,
            const Text(
              'Time ordered: 12:47pm',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            const Divider(),
            const Text(
              'Delivery details',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
            10.h.sbH,
            const Text(
              'Delivery address: Lagos',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            4.h.sbH,
            const Text(
              'Phone no: +12345678901',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            4.h.sbH,
            const Text(
              'Alternate phone no: +12378415690',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
