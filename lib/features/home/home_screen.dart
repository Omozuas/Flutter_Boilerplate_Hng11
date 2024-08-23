import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/providers/auth.provider.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/string_extensions.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/features/home/home_widget/customer_list_tile.dart';
import 'package:flutter_boilerplate_hng11/features/home/home_widget/model/dashboard_model.dart';
import 'package:flutter_boilerplate_hng11/features/home/home_widget/provider/dashboard.provider.dart';
import 'package:flutter_boilerplate_hng11/features/home/home_widget/revenue_card.dart';
import 'package:flutter_boilerplate_hng11/localiza/strings.dart';
import 'package:flutter_boilerplate_hng11/utils/Styles/text_styles.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../utils/app_images.dart';
import '../../utils/custom_text_style.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';

//import 'home_widget/widgets/chart_loader.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashBoardStateProvider = ref.watch(dashBoardProvider);
    final dashBoardProviderNotifier = ref.watch(dashBoardProvider.notifier);
    final authStateProvider = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColors.white,
        bottomOpacity: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://img.freepik.com/free-photo/cartoon-character-with-handbag-sunglasses_71767-99.jpg"),
                      fit: BoxFit.cover)),
            ),
            8.sp.sbHW,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringManager.welcomeBackDashboard,
                  style: CustomTextStyles.productSmallBodyTextBlack
                      .copyWith(color: const Color(0xFF71717A)),
                ),
                Text(
                  authStateProvider.user?.firstName ?? "",
                  style: CustomTextStyles.productTextBody2Black
                      .copyWith(fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () =>
                    dashBoardProviderNotifier.goToNotification(context),
                child: SvgPicture.asset(
                  AppSvgs.notification,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
              16.w.sbW
            ],
          )
        ],
      ),
      backgroundColor: GlobalColors.white,
      body: ListView(
        padding: 16.w.padH,
        children: [
          16.h.sbH,
          Text(StringManager.dashboard,
              style:
                  CustomTextStyle.bold(fontSize: 24.sp, color: Colors.black)),
          Text(
            StringManager.thisMonthSummary,
            style: TextStyle(
              fontSize: 16.sp,
              color: GlobalColors.gray600Color,
            ),
          ),
          20.h.sbHW,
          Container(
            margin: 16.sp.padB,
            child: Column(
              children: [
                Row(
                  children: [
                    RevenueCard(
                      title: StringManager.totalMembers,
                      image: AppSvgs.people,
                      value: dashBoardStateProvider.dashBoardData.revenue ==
                              null
                          ? "0"
                          : formatNumber(
                              dashBoardStateProvider.dashBoardData.revenue ?? 0,
                              decimalPlaces: 0),
                      details: "+ 23 from last month",
                    ),
                    18.w.sbW,
                    RevenueCard(
                      title: StringManager.totalProducts,
                      image: AppSvgs.totalProducts,
                      value:
                          dashBoardStateProvider.dashBoardData.subscriptions ==
                                  null
                              ? "0"
                              : formatNumber(
                                  dashBoardStateProvider
                                          .dashBoardData.subscriptions ??
                                      0,
                                  decimalPlaces: 0),
                      details: "+ 4 from last month",
                    ),
                  ],
                ),
                16.w.sbH,
                Row(
                  children: [
                    RevenueCard(
                      title: StringManager.subscriptions,
                      image: AppSvgs.allSub,
                      value: dashBoardStateProvider.dashBoardData.revenue ==
                              null
                          ? "0"
                          : formatNumber(
                              dashBoardStateProvider.dashBoardData.revenue ?? 0,
                              decimalPlaces: 0),
                      details: "+ 2 from last month",
                    ),
                    18.w.sbW,
                    RevenueCard(
                      title: StringManager.totalProducts,
                      image: AppSvgs.activeMembers,
                      value:
                          dashBoardStateProvider.dashBoardData.subscriptions ==
                                  null
                              ? "0"
                              : formatNumber(
                                  dashBoardStateProvider
                                          .dashBoardData.subscriptions ??
                                      0,
                                  decimalPlaces: 0),
                      details: "+ 23 from last month",
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Add a Product & Add a member
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onTap: () {
                  context.go(AppRoute.products);
                  context.push(AppRoute.addProduct);
                },
                borderColor: GlobalColors.orange,
                text: StringManager.addAProduct,
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                height: 46.h,
                containerColor: GlobalColors.orange,
                width: 151.w,
                textColor: Colors.white,
                icon: SvgPicture.asset(
                  AppSvgs.products,
                  height: 20.h,
                  width: 20.w,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
              16.w.sbW,
              CustomButton(
                onTap: () {},
                borderColor: const Color(0xFFF6F6F6),
                text: StringManager.addAMember,
                textStyle: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                height: 46.h,
                containerColor: Colors.transparent,
                width: 151.w,
                textColor: GlobalColors.black,
                icon: SvgPicture.asset(
                  AppSvgs.addUser,
                  height: 20.h,
                  width: 20.w,
                  // ignore: deprecated_member_use
                  color: Colors.black,
                ),
              ),
            ],
          ),
          16.w.sbH,
          // Recent Sales
          Container(
            padding: 7.sp.padA,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12.r
              ),
              border: Border.all(
                width: 0.50, color: GlobalColors.borderColor
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      StringManager.recentSalesTitle,
                      style: CustomTextStyle.bold(
                        fontSize: 16.sp,
                        color: GlobalColors.black
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Padding(
                        padding: 8.h.padV,
                        child: Text(
                          StringManager.seeMore,
                          style: CustomTextStyle.regular(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Divider(
                  height: 8.h,
                  color: GlobalColors.dividerColor,
                ),
                if((dashBoardStateProvider.dashBoardData.monthSales?.length??0)==0)
                SizedBox(
                  height: 100.h,
                  width: width(context),
                  child: const Center(
                    child: Text("No sales yet this month"),
                  ),
                )
                else
                  Column(
                    children: List.generate(
                        dashBoardStateProvider
                                .dashBoardData.monthSales?.length ??
                            0, (index) {
                      MonthSale monthlySale = dashBoardStateProvider
                              .dashBoardData.monthSales?[index] ??
                          MonthSale();
                      return CustomerListTile(
                        customerName:  'Unknown Customer',
                        email: 'No Email Provided',
                        amount: monthlySale.amount??0,
                      );
                    }
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SalesData {
  final String month;
  final int veryGood;
  final int good;
  final int poor;

  SalesData(this.month, this.veryGood, this.good, this.poor);
}
