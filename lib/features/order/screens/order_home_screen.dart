import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/features/order/models/order.dart';
import 'package:flutter_boilerplate_hng11/features/order/widgets/order_tile.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderHomeScreen extends StatefulWidget {
  const OrderHomeScreen({super.key});

  @override
  State<OrderHomeScreen> createState() => _OrderHomeScreenState();
}

class _OrderHomeScreenState extends State<OrderHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBack: () {},
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Orders',
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 29.25),
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset('assets/icons/search.svg'),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListView.builder(
                  itemCount: 8,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    String deliveryText;
                    Color deliveryColor;

                    if (index < 2) {
                      deliveryText = 'Estimated Delivery on 26th Aug';
                      deliveryColor = GlobalColors.verified; // Green color
                    } else {
                      bool isEstimatedDelivery = (index - 2) % 2 == 1;
                      deliveryText = isEstimatedDelivery
                          ? 'Estimated Delivery on 26th Aug'
                          : 'Delivered on 19th Aug';
                      deliveryColor = isEstimatedDelivery
                          ? GlobalColors.verified // Green color
                          : GlobalColors.redColor; // Red color
                    }

                    return OrderTile(
                      order: Order(
                        number: 99012,
                        image:
                            'assets/images/png/product_listing/sport_shoes.png',
                        deliveryDate: '20-Aug-2024',
                        deliveryTime: '7:41 PM',
                        deliveryText: deliveryText,
                        deliveryColor: deliveryColor,
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
