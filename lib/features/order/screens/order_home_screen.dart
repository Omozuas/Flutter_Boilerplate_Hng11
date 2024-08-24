import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/features/order/widgets/order_tile.dart';
// import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
// import 'package:flutter_boilerplate_hng11/features/auth/widgets/chevron_back_button.dart';
import 'package:flutter_boilerplate_hng11/features/order/models/order.dart';
// import 'package:flutter_boilerplate_hng11/features/order/widgets/order_tile.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
>>>>>>>>> Temporary merge branch 2
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

class OrderHomeScreen extends StatefulWidget {
  const OrderHomeScreen({super.key});

  @override
  State<OrderHomeScreen> createState() => _OrderHomeScreenState();
}

class _OrderHomeScreenState extends State<OrderHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.simpleTitle(
        titleText: 'Orders',
        onBack: () {},
      ),
      body: Column(
        children: [
          Divider(
            color: const Color(0xFFF6F6F6),
            height: 1.h,
          ),
          Expanded(
            child: ListView(
              children: [
                ListView.builder(
                  itemCount: 8,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 8.0),
                  itemBuilder: (_, index) {
                    bool isEstimatedDelivery = index % 4 < 2;

                    String deliveryText = isEstimatedDelivery
                        ? 'Estimated Delivery on 26th Aug'
                        : 'Delivered on 19th Aug';
                    Color deliveryColor = isEstimatedDelivery
                        ? GlobalColors.verified
                        : GlobalColors.redColor;

<<<<<<<<< Temporary merge branch 1
                    num price = (product.price ?? 0) * quantity;

=========
>>>>>>>>> Temporary merge branch 2
                    return OrderTile(
                      order: Order(
                        number: 99012,
                        image:
                            'assets/images/png/product_listing/sport-shoes.png',
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
