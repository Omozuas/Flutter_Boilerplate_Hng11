import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/Styles/text_styles.dart';
import '../../../utils/global_colors.dart';
import '../../../utils/global_size.dart';

class ProductCardWiget extends StatelessWidget {
  const ProductCardWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GlobalScreenSize.getScreenHeight(context) * .156,
      width: GlobalScreenSize.getScreenWidth(context),
      padding:
          EdgeInsets.only(top: 14.h, bottom: 14.h, right: 10.w, left: 8.5.w),
      decoration: BoxDecoration(
          border: Border.all(color: GlobalColors.productBorderColor),
          borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        children: [
          Assets.images.png.productListing.product
              .image(height: GlobalScreenSize.getScreenHeight(context) * .135),
          SizedBox(
            width: 14.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: GlobalScreenSize.getScreenWidth(context) * 0.52,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Product 1",
                          style: CustomTextStyles.productTextTitleBlack,
                        ),
                        Text(
                          "P001",
                          style: CustomTextStyles.productTextBodyBlack,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      "\$19.00",
                      style: CustomTextStyles.productTextBody2Black,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                height: 0.5,
                width: GlobalScreenSize.getScreenWidth(context) * 0.52,
                color: GlobalColors.productBorderColor,
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                width: GlobalScreenSize.getScreenWidth(context) * 0.52,
                child: Row(
                  children: [
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Status:",
                          style: CustomTextStyles.productTextBody2Black,
                        ),
                        Row(
                          children: [
                            Assets.images.svg.productListing.active.svg(),
                            Text(
                              "In stock",
                              style: CustomTextStyles.productTextBody4Black,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: GlobalScreenSize.getScreenHeight(context) * 0.045,
                      width: GlobalScreenSize.getScreenWidth(context) * 0.25,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: GlobalColors.orange,
                          ),
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Center(
                        child: Text(
                          'Add to Cart',
                          style: CustomTextStyles.bodyTextOrange,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}