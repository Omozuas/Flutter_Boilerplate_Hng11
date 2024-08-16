import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/Styles/text_styles.dart';
import 'product_card.dart';

class ProductCardListWidget extends StatelessWidget {
  const ProductCardListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Breakfast",
                style: PlusJakartaTextStyle.headerText2,
              ),
              Text(
                "See more",
                style: PlusJakartaTextStyle.bodyTextGrey,
              )
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
            height: GlobalScreenSize.getScreenHeight(context) * .156,
            width: GlobalScreenSize.getScreenWidth(context),
            child: ListView.separated(
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return SizedBox(
                  width: GlobalScreenSize.getScreenWidth(context) * 0.88,
                  child: const ProductCardWiget(),
                );
              },
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                width: 16.w,
              ),
            ))
      ],
    );
  }
}
