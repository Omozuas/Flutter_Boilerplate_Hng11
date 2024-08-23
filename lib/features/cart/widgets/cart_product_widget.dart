import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/global_colors.dart';
import '../../product_listing/screens/product_detail/product_details_screen.dart';
import '../utils/widget_extensions.dart';
import 'cart_add_remove_button.dart';
import 'price_text_widget.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key,
    required this.price,
    required this.quantity,
    required this.isLast,
    required this.name,
    required this.image,
    required this.description,
    required this.isSelected,
    required this.removeItem,
    required this.selectItem,
    required this.addQuantity,
    required this.reduceQuantity,
  });

  final String name;
  final String image;
  final String description;
  final num price;
  final int quantity;
  final bool isLast;
  final bool isSelected;
  final VoidCallback removeItem;
  final VoidCallback selectItem;
  final VoidCallback addQuantity;
  final VoidCallback reduceQuantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.h.sbH,
        SizedBox(
          height: 131.sp,
          width: width(context),
          child: Row(
            children: [
              Builder(
                builder:(context){
                  return Container(
                    height: 131.sp,
                    width: 173.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        image:  image.contains("http")?  DecorationImage(
                            image: CachedNetworkImageProvider(image)
                            ,
                            fit: BoxFit.cover):null),
                    child: Container(
                      child: image.contains("http")? null: image.isValidBase64? Image.memory(
                        height: 131.h,
                        width: 173.sp,
                        fit: BoxFit.cover,
                        base64Decode(image),
                        errorBuilder: (context, error, stackTrace) =>
                        const EmptyImage(),
                      ): const EmptyImage()
                    ),
                  );
                } ,
              ),
              0.w.sbW,
              Expanded(
                child: Padding(
                  padding: 16.h.padV,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: const Color(0xFF0A0A0A),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                5.h.sbH,
                                Text(description,
                                    maxLines: 2,
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 12.sp,
                                      color: const Color(0xFF6E7079),
                                    ))
                              ],
                            ),
                          ),
                          10.sp.sbW,
                          InkWell(
                            onTap: removeItem,
                            child: Container(
                              padding: 8.w.padA,
                              child: Icon(
                                Icons.close,
                                size: 24.sp,
                                color: GlobalColors.darkOne,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              height: 22.h,
                              child: FittedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    PriceWidget(
                                      value: price,
                                      isBold: true,
                                      size: 18.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          5.w.sbW,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              NewIconButton(
                                onPressed: reduceQuantity,
                                isAdd: false,
                              ),
                              11.w.sbW,
                              Padding(
                                padding: 2.5.padB,
                                child: Text(
                                  "$quantity",
                                  style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              11.w.sbW,
                              NewIconButton(
                                onPressed: addQuantity,
                                isAdd: true,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        16.h.sbH,
        isLast
            ? 0.0.sbH
            : Divider(
                color: const Color(0xFFDEDEDE),
                height: 1.h,
              ),
      ],
    );
  }
}
