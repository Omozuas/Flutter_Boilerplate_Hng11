import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/global_colors.dart';
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
              Container(
                height: 131.sp,
                width: 173.sp,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            image
                        ),
                        fit: BoxFit.cover
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: selectItem,
                      child: Container(
                        margin: 16.sp.padA,
                        padding: 3.sp.padA,
                        width: 25.sp,
                        height: 25.sp,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFAFAFA),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 1, color: Color(0xFF525252)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: isSelected? Container(
                          color: GlobalColors.orange,
                        ): null,
                      ),
                    )
                  ],
                ),
              ),
              17.w.sbW,
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
                                Text(
                                    description,
                                    maxLines: 2,
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 12.sp,
                                      color: const Color(0xFF6E7079),
                                    )
                                )
                              ],
                            ),
                          ),
                          10.sp.sbW,
                          InkWell(
                            onTap: removeItem,
                            child: Container(
                              padding: 8.w.padA,
                              child: Icon(
                                Icons.close, size: 24.sp,
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
                            child: PriceWidget(
                              value: price,
                              isBold: true,
                              size: 18.sp,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              NewIconButton(
                                onPressed: reduceQuantity, isAdd: false,
                              ),
                              11.w.sbW,
                              Padding(
                                padding: 2.5.padB,
                                child: Text(
                                  "$quantity",
                                  style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                  ),
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
        isLast?
        0.0.sbH:
        Divider(color: const Color(0xFFDEDEDE), height: 1.h,),
      ],
    );
  }
}