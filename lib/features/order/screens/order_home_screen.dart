import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/features/order/widgets/order_tile.dart';
import 'package:flutter_boilerplate_hng11/utils/app_images.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_boilerplate_hng11/features/order/models/order.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderHomeScreen extends StatefulWidget {
  const OrderHomeScreen({super.key});

  @override
  State<OrderHomeScreen> createState() => _OrderHomeScreenState();
}

class _OrderHomeScreenState extends State<OrderHomeScreen> {
  bool isSearching = false;
  List<Order> allOrders = [];
  List<Order> filteredOrder = [];
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      allOrders = generateOrders();
      filteredOrder = List.from(allOrders);
      setState(() {});
    });
    super.initState();
  }
  List<Order> generateOrders() {
    return List.generate(8, (index) {
      int number = 9900 + index;
      bool isEstimatedDelivery = index < 2 || (index - 2) % 2 == 1;
      return Order(
        id: index,
        number: number,
        image: AppImages.shoes,
        deliveryDate: context.deliveryDate,
        deliveryTime: context.deliveryTime,
        deliveryText: isEstimatedDelivery
            ? context.deliveryText
            : context.deliveryDateText,
        deliveryColor:
            isEstimatedDelivery ? GlobalColors.verified : GlobalColors.redColor,
      );
    });
  }

  void searchOrders(String filter) {
    setState(() {
      if (filter.isEmpty) {
        filteredOrder = List.from(allOrders);
      } else {
        filteredOrder = allOrders
            .where((order) => order.number.toString().contains(filter))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // onBack: () {
        //   context.go(AppRoute.home);
        // },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            !isSearching
                ? Text(
                    context.order,
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search by Order ID',
                        border: InputBorder.none,
                      ),
                      onChanged: searchOrders,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(right: 29.25),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isSearching = !isSearching;
                    if (!isSearching) {
                      searchController.clear();
                      searchOrders('');
                    }
                  });
                },
                child: isSearching
                    ? const Icon(Icons.close)
                    : SvgPicture.asset('assets/icons/search.svg'),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListView.builder(
                    itemCount: filteredOrder.length,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => OrderTile(
                          order: filteredOrder[index],
                          onTap: () => context.push(
                              '${AppRoute.orderDetails}/${filteredOrder[index].id}'),
                        )),
                if (isSearching && filteredOrder.isEmpty)
                  Center(
                      child: Text(
                          'No Order id found for "${searchController.text}"'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
