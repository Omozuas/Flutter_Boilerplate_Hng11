import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/Styles/text_styles.dart';
import '../../../utils/global_colors.dart';
import '../../../utils/global_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductCardWiget extends StatelessWidget {
  const ProductCardWiget(
      {super.key,
      required this.productNmae,
      required this.status,
      required this.price,
      required this.image,
      required this.category});

  final String productNmae;
  final String category;
  final String status;
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
            if (image.isNotEmpty) {
              if (image.startsWith('http')) {
                return Image.network(
                  image,
                  width: 104.w,
                  height: 104.h,
                );
              } else if (image.isValidBase64) {
                return ClipRRect(
                  borderRadius:
                      BorderRadius.circular(8.0), // Adjust the radius here

                  child: Image.memory(
                    width: 104.w,
                    height: 104.h,
                    fit: BoxFit.cover,
                    base64Decode(image),
                    errorBuilder: (context, error, stackTrace) =>
                        Assets.images.png.productListing.product.image(
                      height: GlobalScreenSize.getScreenHeight(context) * .135,
                    ),
                  ),
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
                  category,
                  style: CustomTextStyles.productTextBodyBlack,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  "${AppLocalizations.of(context)!.statusLabel}:",
                  style: CustomTextStyles.productTextBody2Black,
                ),
                Row(
                  children: [
                    if (status.contains(
                        AppLocalizations.of(context)!.inStockLabel)) ...[
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
                      status,
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
              textAlign: TextAlign.end,
              style: CustomTextStyles.productTextBody2Black,
            ),
          )
        ],
      ),
    );
  }
}
