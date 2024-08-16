import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/home/home_widget/customer_list_tile.dart';
import 'package:flutter_boilerplate_hng11/features/home/home_widget/revenue_card.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/global_size.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Map<String, dynamic>> customers = [
      {'name': 'Customer 1', 'email': 'customer1@example.com', 'amount': '100'},
      {'name': 'Customer 2', 'email': 'customer2@example.com', 'amount': '200'},
      // Add more customers here
    ];

    final List<SalesData> data = [
      SalesData('Jan', 100, 50, 200),
      SalesData('Feb', 150, 100, 150),
      SalesData('Mar', 200, 150, 100),
      SalesData('Apr', 150, 200, 50),
      SalesData('May', 100, 150, 200),
      SalesData('Jun', 50, 100, 250),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColors.white,
        bottomOpacity: 1,
        leading: Padding(
          padding: EdgeInsets.only(left: 26.0.w),
          child:
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
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
                    label:
                        Text('5'), // Replace with the actual notification count
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: GlobalScreenSize.getScreenHeight(context) * 0.008,
              ),
              Text(
                'This Month\'s Summary',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: GlobalColors.gray600Color,
                ),
              ),
              SizedBox(
                height: GlobalScreenSize.getScreenHeight(context) * 0.020,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const RevenueCard(
                        title: 'Total Revenue',
                        value: '\$20000',
                        percentageChange: '+15% decrease',
                      ),
                      SizedBox(
                        width: GlobalScreenSize.getScreenWidth(context) * 0.018,
                      ),
                      const RevenueCard(
                        title: 'Total Revenue',
                        value: '\$20000',
                        percentageChange: '+65% decrease',
                      ),
                      SizedBox(
                        width: GlobalScreenSize.getScreenWidth(context) * 0.018,
                      ),
                      const RevenueCard(
                        title: 'Total Revenue',
                        value: '\$20000',
                        percentageChange: '+45% decrease',
                      ),
                      SizedBox(
                        width: GlobalScreenSize.getScreenWidth(context) * 0.018,
                      ),
                      const RevenueCard(
                        title: 'Total Revenue',
                        value: '\$20000',
                        percentageChange: '+25% decrease',
                      ),
                      SizedBox(
                        width: GlobalScreenSize.getScreenWidth(context) * 0.018,
                      ),
                      const RevenueCard(
                        title: 'Total Revenue',
                        value: '\$20000',
                        percentageChange: '+75% decrease',
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    'Overview',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See more',
                      style: TextStyle(
                        color: GlobalColors.gray600Color,
                      ),
                    ),
                  )
                ],
              ),

              // Overview (Bar Chart)
              Container(
                padding: EdgeInsets.all(24.w),
                child: SfCartesianChart(
                  backgroundColor: Colors.white,
                  plotAreaBorderColor: Colors.transparent,
                  primaryXAxis: CategoryAxis(
                    majorGridLines: const MajorGridLines(width: 0),
                    axisLine: const AxisLine(width: 0),
                    // Add label style customization
                    labelStyle: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.sp,
                    ),
                  ),
                  primaryYAxis: const NumericAxis(
                    majorGridLines: MajorGridLines(width: 0),
                    minorGridLines: MinorGridLines(width: 0),
                    axisLine: AxisLine(width: 0),
                    // Add axis label
                  ),
                  series: <CartesianSeries>[
                    ColumnSeries<SalesData, String>(
                      dataSource: data,
                      xValueMapper: (SalesData data, _) => data.month,
                      yValueMapper: (SalesData data, _) => data.veryGood,
                      color: const Color(0xFFE0E0E0),
                      name: 'Very Good',
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      width: 0.7, // Reduce the bar width to allow overlapping
                    ),
                    ColumnSeries<SalesData, String>(
                      dataSource: data,
                      xValueMapper: (SalesData data, _) => data.month,
                      yValueMapper: (SalesData data, _) => data.good,
                      color: const Color(0xFFFFC107),
                      name: 'Good',
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      width: 0.7, // Reduce the bar width to allow overlapping
                    ),
                    ColumnSeries<SalesData, String>(
                      dataSource: data,
                      xValueMapper: (SalesData data, _) => data.month,
                      yValueMapper: (SalesData data, _) => data.poor,
                      color: const Color(0xFFC70039),
                      name: 'Poor',
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      width: 0.7, // Reduce the bar width to allow overlapping
                    ),
                  ],
                ),
              ),

              // Recent Sales
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Recent Sales',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'See more',
                            style: TextStyle(
                              color: GlobalColors.gray600Color,
                            ),
                          ),
                        )
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: customers.length,
                      itemBuilder: (context, index) {
                        final customer = customers[index];
                        return CustomerListTile(
                          customerName: customer['name'] ?? 'Unknown Customer',
                          email: customer['email'] ?? 'No Email Provided',
                          amount: customer['amount'] ?? '0.00',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
