import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/Styles/text_styles.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/global_size.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/progress_colour.dart';

import 'package:flutter_boilerplate_hng11/features/order/models/order.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';

import '../../../utils/custom_text_style.dart';
import '../../../utils/widgets/divider.dart';
import '../../../utils/widgets/list_tile.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({
    super.key,
    required this.order,
    // required this.name,
    required this.image,
    // required this.price,
  });

  final Order order;
  final String image;
  // final num price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.simpleTitle(
        titleText: context.orderDetails,
        showDivider: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            13.h.sbH,
            Padding(
              padding: 16.h.padH,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 203.h,
                    padding: 10.sp.padA,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F4),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Image.asset(
                      image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  20.h.sbH,
                  SizedBox(
                    width: GlobalScreenSize.getScreenWidth(context),
                    child: Row(
                      children: [
                        Text("${context.order}:",
                            style: CustomTextStyle.semiBold(fontSize: 18.sp)),
                        10.w.sbHW,
                        Text("#${order.number}:",
                            style: CustomTextStyle.semiBold(
                                fontSize: 18.sp,
                                color: const Color(0xF40013C1))),
                        const Spacer(),
                        CustomButton(
                            onTap: () {},
                            borderColor: GlobalColors.greenTextColor,
                            text: context.paid,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 8),
                            containerColor: GlobalColors.greenTextColor,
                            textColor: GlobalColors.white),
                        10.w.sbHW,
                        CustomButton(
                            onTap: () {},
                            borderColor: Colors.transparent,
                            text: context.packaing,
                            containerColor: const Color(0xFFEBF8FF),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 8),
                            textColor: GlobalColors.lightBlueTextColor)
                      ],
                    ),
                  ),
                  8.h.sbH,
                  Text(context.orderCreated,
                      style: CustomTextStyle.semiBold(
                          fontSize: 12.sp, color: GlobalColors.black)),
                  8.h.sbH,
                  Text(context.augustDate,
                      style: CustomTextStyle.regular(
                        fontSize: 12.sp,
                      )),
                ],
              ),
            ),
            15.h.sbH,
            Container(
              height: GlobalScreenSize.getScreenHeight(context) * 0.269,
              width: GlobalScreenSize.getScreenWidth(context),
              color: GlobalColors.zinc50,
              padding: EdgeInsets.all(16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.progress,
                    style: CustomTextStyles.productTextBody2Black100,
                  ),
                  15.h.sbH,
                  SizedBox(
                    height: GlobalScreenSize.getScreenHeight(context) * 0.006,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (cxt, index) {
                        var colours = [
                          GlobalColors.green100,
                          GlobalColors.green100,
                          GlobalColors.lightBlue,
                          GlobalColors.gray200,
                          GlobalColors.gray200
                        ];
                        return CustomProgressBar().linearProgressBar(
                            context: context,
                            color: colours[index],
                            leftBottomPadding: index == 0 ? 8 : 0,
                            leftTopPadding: index == 0 ? 8 : 0,
                            rightBottomPadding: index == 4 ? 8 : 0,
                            rightTopPadding: index == 4 ? 8 : 0);
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          8.w.sbW,
                    ),
                  ),
                  13.h.sbH,
                  Row(
                    children: [
                      Text(
                        context.processing,
                        style: CustomTextStyles.bannerbodyTextgrey,
                      ),
                      4.w.sbW,
                      Assets.images.svg.productListing.loading.svg()
                    ],
                  ),
                  18.h.sbH,
                  Center(
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                    width: 1, color: GlobalColors.diverColor)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Assets.images.svg.productListing.van.svg(),
                                Text(
                                  context.estimate,
                                  style: CustomTextStyles
                                      .productSmallBodyTextMuted,
                                ),
                                Text(
                                  context.aug,
                                  style:
                                      CustomTextStyles.bannerbodyTextBlack100,
                                )
                              ],
                            )),
                        12.h.sbH,
                        CustomButton(
                            onTap: () {},
                            borderColor: GlobalColors.orange,
                            text: context.confirmShip,
                            height: GlobalScreenSize.getScreenHeight(context) *
                                .040,
                            containerColor: GlobalColors.orange,
                            width:
                                GlobalScreenSize.getScreenWidth(context) * .75,
                            textColor: GlobalColors.white),
                      ],
                    ),
                  )
                ],
              ),
            ),
            16.h.sbH,
            Container(
                height: GlobalScreenSize.getScreenHeight(context) * 0.330,
                width: GlobalScreenSize.getScreenWidth(context),
                color: GlobalColors.zinc50,
                padding: EdgeInsets.all(23.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.cusDetails,
                      style: CustomTextStyles.bannerbodyTextBlack100,
                    ),
                    9.h.sbH,
                    Text(
                      context.james,
                      style: CustomTextStyles.bannerbodyTextBlack200,
                    ),
                    8.h.sbH,
                    Text(
                      "jameshung@gmail.com",
                      style: CustomTextStyles.bannerbodyTextBlue100,
                    ),
                    8.h.sbH,
                    Text(
                      "+234 9045004705",
                      style: CustomTextStyles.bannerbodyTextBlack100,
                    ),
                    20.h.sbH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomDivider().shortDivider(context),
                        31.w.sbW,
                        CustomDivider().shortDivider(context),
                      ],
                    ),
                    8.h.sbH,
                    Text(
                      context.shippingDetails,
                      style: CustomTextStyles.bannerbodyTextBlack200,
                    ),
                    4.h.sbH,
                    Text(
                      "James Hung Ltd",
                      style: CustomTextStyles.bannerbodyTextBlack300,
                    ),
                    4.h.sbH,
                    Text(
                      "112, Houstin Street",
                      style: CustomTextStyles.bannerbodyTextBlack300,
                    ),
                    4.h.sbH,
                    Text(
                      "New York",
                      style: CustomTextStyles.bannerbodyTextBlack300,
                    ),
                    4.h.sbH,
                    Text(
                      "United States",
                      style: CustomTextStyles.bannerbodyTextBlack300,
                    ),
                  ],
                )),
            16.h.sbH,
            Container(
                height: GlobalScreenSize.getScreenHeight(context) * 0.250,
                width: GlobalScreenSize.getScreenWidth(context),
                color: GlobalColors.zinc50,
                padding: EdgeInsets.all(23.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.orderSumarry,
                        style: CustomTextStyles.bannerbodyTextBlack100,
                      ),
                      4.h.sbH,
                      CustomTiles()
                          .textTile(context, context.subTotal, "190.00"),
                      4.h.sbH,
                      CustomTiles().textTile(context, context.dis, "0.00"),
                      4.h.sbH,
                      CustomTiles()
                          .textTile(context, context.shippingCost, "0.00"),
                      4.h.sbH,
                      CustomTiles().textTile2(context, context.tot, "190.00"),
                      20.h.sbH,
                      Center(
                        child: CustomButton(
                          text: context.resendInvoice,
                          textStyle: CustomTextStyles.bannerbodyTextBlack,
                          borderColor: GlobalColors.lightGray,
                          containerColor: GlobalColors.white,
                          onTap: () {},
                          height:
                              GlobalScreenSize.getScreenHeight(context) * .040,
                          width: GlobalScreenSize.getScreenWidth(context) * .75,
                          textColor: GlobalColors.white,
                        ),
                      )
                    ])),
            16.h.sbH,
            // Container(
            //     height: GlobalScreenSize.getScreenHeight(context) * 0.250,
            //     width: GlobalScreenSize.getScreenWidth(context),
            //     color: GlobalColors.zinc50,
            //     padding: EdgeInsets.all(23.w),
            //     child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             "Products",
            //             style: CustomTextStyles.bannerbodyTextBlack100,
            //           ),
            //           12.h.sbH,
            //           Container(
            //             height:
            //                 GlobalScreenSize.getScreenHeight(context) * 0.132,
            //             width: GlobalScreenSize.getScreenWidth(context) * 0.8,
            //             decoration: ,
            //           )
            //         ]))
          ],
        ),
      ),
    );
  }
}
