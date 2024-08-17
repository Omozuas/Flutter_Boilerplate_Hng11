import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/providers/auth.provider.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/string_extensions.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/features/home/home_widget/customer_list_tile.dart';
import 'package:flutter_boilerplate_hng11/features/home/home_widget/provider/dashboard.provider.dart';
import 'package:flutter_boilerplate_hng11/features/home/home_widget/revenue_card.dart';
import 'package:flutter_boilerplate_hng11/utils/Styles/text_styles.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/global_size.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

import 'home_widget/widgets/chart_loader.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashBoardStateProvider = ref.watch(dashBoardProvider);
    final authStateProvider = ref.watch(authProvider);

    final List<Map<String, dynamic>> customers = [
      {'name': 'Customer 1', 'email': 'customer1@example.com', 'amount': '100'},
      {'name': 'Customer 2', 'email': 'customer2@example.com', 'amount': '200'},
      // Add more customers here
    ];

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
                    "Welcome Back!",
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
            Padding(
              padding: EdgeInsets.only(right: 8.0.w),
              child: Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications),
                  ),
                  const Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: Badge(
                      label: Text(
                          '5'), // Replace with the actual notification count
                      textColor: Colors.white,
                      backgroundColor: Colors.red,
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: GlobalColors.white,
        body: Container()
        // ListView(
        //   padding: 16.w.padH,
        //   children: [
        //     16.h.sbH,
        //     Text(
        //       'Dashboard',
        //       style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        //     ),
        //     SizedBox(
        //       height: GlobalScreenSize.getScreenHeight(context) * 0.008,
        //     ),
        //     Text(
        //       'This Month\'s Summary',
        //       style: TextStyle(
        //         fontSize: 16.sp,
        //         color: GlobalColors.gray600Color,
        //       ),
        //     ),
        //     SizedBox(
        //       height: GlobalScreenSize.getScreenHeight(context) * 0.020,
        //     ),
        //     Row(
        //       children: [
        //         RevenueCard(
        //           title: 'Total Revenue',
        //           value: dashBoardStateProvider.dashBoardData.revenue == null
        //               ? "0.00"
        //               : formatNumber(
        //                   dashBoardStateProvider.dashBoardData.revenue ?? 0,
        //                   decimalPlaces: 2),
        //           percentageChange: '+15% decrease',
        //         ),
        //         18.w.sbW,
        //         RevenueCard(
        //           title: 'Total Revenue',
        //           value: dashBoardStateProvider.dashBoardData.subscriptions ==
        //                   null
        //               ? "0"
        //               : formatNumber(
        //                   dashBoardStateProvider.dashBoardData.subscriptions ?? 0,
        //                   decimalPlaces: 0),
        //           percentageChange: '+65% decrease',
        //           isRevenue: false,
        //         ),
        //       ],
        //     ),
        //     Row(
        //       children: [
        //         Text(
        //           'Overview',
        //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        //         ),
        //         const Spacer(),
        //         TextButton(
        //           onPressed: () {},
        //           child: Text(
        //             'See more',
        //             style: TextStyle(
        //               color: GlobalColors.gray600Color,
        //             ),
        //           ),
        //         )
        //       ],
        //     ),

        //     // Overview (Bar Chart)
        //     dashBoardStateProvider.trendLoading
        //         ? const ChartLoader()
        //         : dashBoardStateProvider.mapData.isEmpty
        //             ? const ChartEmpty()
        //             : Container(
        //                 padding: EdgeInsets.all(24.w),
        //                 height: 302.h,
        //                 child: SfCartesianChart(
        //                   backgroundColor: Colors.white,
        //                   plotAreaBorderColor: Colors.transparent,
        //                   primaryXAxis: CategoryAxis(
        //                     majorGridLines: const MajorGridLines(width: 0),
        //                     axisLine: const AxisLine(width: 0),
        //                     // Add label style customization
        //                     labelStyle: TextStyle(
        //                       color: Colors.grey[600],
        //                       fontSize: 12.sp,
        //                     ),
        //                   ),
        //                   primaryYAxis: const NumericAxis(
        //                     majorGridLines: MajorGridLines(width: 0),
        //                     minorGridLines: MinorGridLines(width: 0),
        //                     axisLine: AxisLine(width: 0),
        //                     // Add axis label
        //                   ),
        //                   series: <CartesianSeries>[
        //                     ColumnSeries<SalesData, String>(
        //                       dataSource: dashBoardStateProvider.mapData,
        //                       xValueMapper: (SalesData data, _) => data.month,
        //                       yValueMapper: (SalesData data, _) => data.veryGood,
        //                       color: const Color(0xFFE0E0E0),
        //                       name: 'Very Good',
        //                       borderRadius: const BorderRadius.only(
        //                         topLeft: Radius.circular(10),
        //                         topRight: Radius.circular(10),
        //                       ),
        //                       width:
        //                           0.7, // Reduce the bar width to allow overlapping
        //                     ),
        //                     ColumnSeries<SalesData, String>(
        //                       dataSource: dashBoardStateProvider.mapData,
        //                       xValueMapper: (SalesData data, _) => data.month,
        //                       yValueMapper: (SalesData data, _) => data.good,
        //                       color: const Color(0xFFFFC107),
        //                       name: 'Good',
        //                       borderRadius: const BorderRadius.only(
        //                         topLeft: Radius.circular(10),
        //                         topRight: Radius.circular(10),
        //                       ),
        //                       width:
        //                           0.7, // Reduce the bar width to allow overlapping
        //                     ),
        //                     ColumnSeries<SalesData, String>(
        //                       dataSource: dashBoardStateProvider.mapData,
        //                       xValueMapper: (SalesData data, _) => data.month,
        //                       yValueMapper: (SalesData data, _) => data.poor,
        //                       color: const Color(0xFFC70039),
        //                       name: 'Poor',
        //                       borderRadius: const BorderRadius.only(
        //                         topLeft: Radius.circular(10),
        //                         topRight: Radius.circular(10),
        //                       ),
        //                       width:
        //                           0.7, // Reduce the bar width to allow overlapping
        //                     ),
        //                   ],
        //                 ),
        //               ),

        //     // Recent Sales
        //     SizedBox(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Row(
        //             children: [
        //               const Text(
        //                 'Recent Sales',
        //                 style: TextStyle(fontWeight: FontWeight.bold),
        //               ),
        //               const Spacer(),
        //               TextButton(
        //                 onPressed: () {},
        //                 child: Text(
        //                   'See more',
        //                   style: TextStyle(
        //                     color: GlobalColors.gray600Color,
        //                   ),
        //                 ),
        //               )
        //             ],
        //           ),
        //           ListView.builder(
        //             shrinkWrap: true,
        //             physics: const NeverScrollableScrollPhysics(),
        //             itemCount: customers.length,
        //             itemBuilder: (context, index) {
        //               final customer = customers[index];
        //               return CustomerListTile(
        //                 customerName: customer['name'] ?? 'Unknown Customer',
        //                 email: customer['email'] ?? 'No Email Provided',
        //                 amount: customer['amount'] ?? '0.00',
        //               );
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),

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
