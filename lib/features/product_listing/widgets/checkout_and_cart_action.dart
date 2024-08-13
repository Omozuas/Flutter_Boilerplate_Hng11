import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutAndCartActions extends StatelessWidget {
  const CheckoutAndCartActions({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 56.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Custombutton(
            onTap: () {},
            borderColor: GlobalColors.borderColor,
            text: "Checkout",
            height: 40,
            containerColor: Colors.white,
            width: screenWidth * 0.4,
            textColor: Colors.black,
          ),
          Custombutton(
            onTap: () {},
            borderColor: GlobalColors.orange,
            text: "Add to Cart",
            height: 40,
            containerColor: GlobalColors.orange,
            width: screenWidth * 0.4,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
