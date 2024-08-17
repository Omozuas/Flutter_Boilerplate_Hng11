import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/Styles/text_styles.dart';
import '../../../utils/global_colors.dart';
import '../../../utils/global_size.dart';

class ProductCardWiget extends StatelessWidget {
  const ProductCardWiget(
      {super.key,
      required this.productNmae,
      required this.inStock,
      required this.price,
      required this.image});

  final String productNmae;
  final bool inStock;
  final int price;

  final String image;
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
          Builder(builder: (context) {
            log(image);

            if (image.isNotEmpty) {
              if (image.startsWith('http')) {
                return Image.network(image);
              } else if (image.isValidBase64) {
                return Image.memory(
                  base64Decode(image),
                  errorBuilder: (context, error, stackTrace) =>
                      Assets.images.png.productListing.product.image(
                          height:
                              GlobalScreenSize.getScreenHeight(context) * .135),
                );
              } else {
                return Assets.images.png.productListing.product.image(
                    height: GlobalScreenSize.getScreenHeight(context) * .135);
              }
            }
            return Assets.images.png.productListing.product.image(
                height: GlobalScreenSize.getScreenHeight(context) * .135);
          }),
          SizedBox(
            width: 14.w,
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productNmae,
                  style: CustomTextStyles.productTextTitleBlack,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "P001",
                  style: CustomTextStyles.productTextBodyBlack,
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  "Status:",
                  style: CustomTextStyles.productTextBody2Black,
                ),
                Row(
                  children: [
                    if (inStock) ...[
                      Assets.images.svg.productListing.active.svg(),
                    ] else ...[
                      Container(
                        width: 1,
                        height: 1,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      )
                    ],
                    Text(
                      inStock ? "In stock" : "Out of stock",
                      style: CustomTextStyles.productTextBody4Black,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "\$$price",
              style: CustomTextStyles.productTextBody2Black,
            ),
          )
        ],
      ),
    );
  }
}
