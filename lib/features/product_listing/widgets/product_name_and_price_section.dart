import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/models/product_detail_model.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/Styles/text_styles.dart';

class ProductNameAndPriceSection extends StatelessWidget {
  const ProductNameAndPriceSection({
    super.key,
    required this.product,
  });

  final ProductDetail product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.name,
                    style: CustomTextStyles.productTextTitleBlack,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    product.subname,
                    style: TextStyle(
                      color: GlobalColors.dark2,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "\$${product.price.toStringAsFixed(2)}",
                    style: CustomTextStyles.productTextTitleBlack,
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.green,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        "In Stock",
                        style: TextStyle(color: GlobalColors.darkOne),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 16.h),
          Row(children: [
            ...List.generate(
              5,
              (index) => Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: Icon(
                  Icons.star,
                  size: 16,
                  color: index < 4
                      ? GlobalColors.orange
                      : GlobalColors.borderColor,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              "(4.5)",
              style: TextStyle(color: GlobalColors.mutedTextColor),
            ),
            SizedBox(width: 10.w),
            InkWell(
              onTap: () {},
              child: Text(
                "See reviews",
                style: CustomTextStyles.bannerbodyTextOrange,
              ),
            )
          ]),
        ],
      ),
    );
  }
}
