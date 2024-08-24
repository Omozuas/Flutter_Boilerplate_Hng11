import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
<<<<<<< HEAD
import 'package:flutter_boilerplate_hng11/features/order/models/order.dart';
import 'package:flutter_boilerplate_hng11/features/order/widgets/order_tile.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
=======
import 'package:flutter_boilerplate_hng11/features/order/widgets/order_tile.dart';
// import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
// import 'package:flutter_boilerplate_hng11/features/auth/widgets/chevron_back_button.dart';
import 'package:flutter_boilerplate_hng11/features/order/models/order.dart';
// import 'package:flutter_boilerplate_hng11/features/order/widgets/order_tile.dart';
>>>>>>> 6e04ab2 (fix: replace all hardcoded strings in add product screen)
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
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
<<<<<<< HEAD
      appBar: CustomAppBar(
        onBack: () {},
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.orderText,
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
=======
      appBar: CustomAppBar.simpleTitle(
        titleText: 'Orders',
        onBack: () {
          context.go()
        },
>>>>>>> 1601975 (include routing to home on back for products and orders page)
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
                      deliveryText = context.deliveryText;
                      deliveryColor = GlobalColors.verified; // Green color
                    } else {
                      bool isEstimatedDelivery = (index - 2) % 2 == 1;
                      deliveryText = isEstimatedDelivery
                          ? context.deliveryText
                          : context.deliveryDateText;
                      deliveryColor = isEstimatedDelivery
                          ? GlobalColors.verified // Green color
                          : GlobalColors.redColor; // Red color
                    }

                    return OrderTile(
                      order: Order(
                        number: 99012,
                        image:
                            'assets/images/png/product_listing/sport_shoes.png',
                        deliveryDate: context.deliveryDate,
                        deliveryTime: context.deliveryTime,
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
