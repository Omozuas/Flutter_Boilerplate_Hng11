import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/providers/auth.provider.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/string_extensions.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/features/home/home_widget/customer_list_tile.dart';
import 'package:flutter_boilerplate_hng11/features/home/home_widget/model/dashboard_model.dart';
import 'package:flutter_boilerplate_hng11/features/home/home_widget/provider/dashboard.provider.dart';
import 'package:flutter_boilerplate_hng11/features/home/home_widget/revenue_card.dart';

import 'package:flutter_boilerplate_hng11/features/user_setting/provider/profile_provider.dart';

import 'package:flutter_boilerplate_hng11/features/user_setting/models/user_model.dart';

//import 'package:flutter_boilerplate_hng11/localiza/strings.dart';
import 'package:flutter_boilerplate_hng11/utils/Styles/text_styles.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
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

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.watch(profileProvider.notifier).getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dashBoardStateProvider = ref.watch(dashBoardProvider);
    final dashBoardProviderNotifier = ref.watch(dashBoardProvider.notifier);
    final authStateProvider = ref.watch(authProvider);
    final asyncUser = ref.watch(profileProvider).user;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColors.white,
        bottomOpacity: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            authStateProvider.user!.avatarUrl == null
                ? CircleAvatar(
                    radius: 28,
                    child: Center(
                      child: Text(
                        // ignore: unnecessary_null_comparison
                        asyncUser.value == null
                            ? 'AN'
                            : initials(asyncUser.value),
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                : Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "${authStateProvider.user!.avatarUrl}"),
                            fit: BoxFit.cover)),
                  ),
            6.sp.sbHW,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.welcomeBack,
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
          Text(context.dashboard,
              style:
                  CustomTextStyle.bold(fontSize: 24.sp, color: Colors.black)),
          Text(
            context.thisMonthSummary,
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
                      title: context.totalMembers,
                      image: AppSvgs.people,
                      value: dashBoardStateProvider.dashBoardData.revenue ==
                              null
                          ? "0"
                          : formatNumber(
                              dashBoardStateProvider.dashBoardData.revenue ?? 0,
                              decimalPlaces: 0),
                      details: context.plusTwentyThree,
                    ),
                    18.w.sbW,
                    RevenueCard(
                        title: context.totalProducts,
                        image: AppSvgs.totalProducts,
                        value: dashBoardStateProvider
                                    .dashBoardData.subscriptions ==
                                null
                            ? "0"
                            : formatNumber(
                                dashBoardStateProvider
                                        .dashBoardData.subscriptions ??
                                    0,
                                decimalPlaces: 0),
                        details: context.plusFourFromLastMonth
                        //"+ 4 from last month",
                        ),
                  ],
                ),
                16.w.sbH,
                Row(
                  children: [
                    RevenueCard(
                      title: context.subscriptions,
                      image: AppSvgs.allSub,
                      value: dashBoardStateProvider.dashBoardData.revenue ==
                              null
                          ? "0"
                          : formatNumber(
                              dashBoardStateProvider.dashBoardData.revenue ?? 0,
                              decimalPlaces: 0),
                      details: context.plusTwoFromLastMonth,
                      //"+ 2 from last month",
                    ),
                    18.w.sbW,
                    RevenueCard(
                      title: context.totalProducts,
                      image: AppSvgs.activeMembers,
                      value: formatNumber(dashBoardStateProvider.productCount,
                          decimalPlaces: 0),
                      details: "",
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
                text: context.addAProduct,
                textStyle: CustomTextStyle.medium(
                    color: Colors.white, fontSize: 14.sp),
                // height: 46.h,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                containerColor: GlobalColors.orange,
                // width: 151.w,
                textColor: Colors.white,
                icon: SvgPicture.asset(
                  AppSvgs.products,
                  height: 20.h,
                  width: 20.w,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
              10.w.sbW,
              CustomButton(
                onTap: () {},
                borderColor: const Color(0xFFD3D3D3),
                text: context.addAMember,
                textStyle: CustomTextStyle.medium(
                    color: Colors.black, fontSize: 14.sp),
                // height: 46.h,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                containerColor: Colors.transparent,
                // width: 151.w,
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
                borderRadius: BorderRadius.circular(12.r),
                border:
                    Border.all(width: 0.50, color: GlobalColors.borderColor)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      context.recentSalesTitle,
                      style: CustomTextStyle.bold(
                          fontSize: 16.sp, color: GlobalColors.black),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: 8.h.padV,
                        child: Text(
                          context.seeMore,
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
                if ((dashBoardStateProvider.dashBoardData.monthSales?.length ??
                        0) ==
                    0)
                  SizedBox(
                    height: 100.h,
                    width: width(context),
                    child: Center(
                      child: Text(
                        context.noSales,
                        style: CustomTextStyle.regular(
                                color: const Color(0xFF98A2B3), fontSize: 16.sp)
                            .copyWith(
                          fontFamily: 'Inter',
                        ),
                      ),
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
                        customerName: context.unknownCustomer,
                        email: context.noEmailProvided,
                        amount: monthlySale.amount ?? 0,
                      );
                    }),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String initials([UserModel? user]) {
    try {
      var initials = 'AN';
      if (user == null) return initials;
      if (user.fullname.isEmpty) return initials;

      final u = user.fullname.split(' ');
      if (u.length == 1) return u.first;
      return '${u[0][0]}${u[1][0]}';
    } catch (e) {
      return 'AN';
    }
  }
}

// The SalesData class represents the data for each bar in the chart
class SalesData {
  SalesData(this.month, this.veryGood, this.good, this.poor);

  final String month;
  final double veryGood;
  final double good;
  final double poor;
}
