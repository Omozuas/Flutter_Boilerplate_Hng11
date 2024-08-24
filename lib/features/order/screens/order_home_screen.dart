import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/order/widgets/order_tile.dart';
import 'package:flutter_boilerplate_hng11/utils/Styles/text_styles.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cart/models/cart_model.dart';

class OrderHomeScreen extends StatefulWidget {
  const OrderHomeScreen({super.key});

  @override
  State<OrderHomeScreen> createState() => _OrderHomeScreenState();
}

class _OrderHomeScreenState extends State<OrderHomeScreen> {
  List<CartData> data = [
    CartData(
        image:
            "https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg",
        name: "Burger",
        quantity: 1,
        price: 10,
        description: "This is a delicious cheese burger"),
    CartData(
        image:
            "https://www.foodiesfeed.com/wp-content/uploads/2023/09/fresh-vegetables.jpg",
        name: "Fruits",
        quantity: 1,
        price: 15,
        description:
            "Fruits are good for the health please endevour to eat them"),
    CartData(
        image:
            "https://www.foodiesfeed.com/wp-content/uploads/2023/10/bowl-of-ice-cream-with-chocolate.jpg",
        name: "Ice cream",
        quantity: 1,
        price: 21,
        description: "A nice bowl of ice cream to cure your cravings"),
    CartData(
        image:
            "https://www.foodiesfeed.com/wp-content/uploads/2023/08/grilled-crispy-pork-with-rice.jpg",
        name: "Rice and Meat Sauce",
        quantity: 1,
        price: 65,
        description:
            "Freshly cooked rice and meat source with cucumber and lettus"),
  ];

  final userData = ["User1", "User2", "User3", "User4"];

  num subTotalPrice = 0;
  num deliveryFee = 10;
  num totalPrice = 0;

  notifyListeners() {
    setState(() {});
  }

  getPrice() {
    subTotalPrice = products.fold(
      0,
      (sum, item) => sum + ((item.quantity ?? 0) * (item.price ?? 0)),
    );
    totalPrice = (subTotalPrice + deliveryFee);
    notifyListeners();
  }

  List<CartData> products = [];

  List<CartData> selectedProducts = [];

  onChanged(String? val) {
    setState(() {});
  }

  init() {
    products = data;
    getPrice();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            "Manage Orders",
            style: CustomTextStyles.producHeaderBlack,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Divider(
            color: const Color(0xFFDEDEDE),
            height: 1.h,
          ),
          Expanded(
            child: ListView(
              children: [
                ListView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: 8.h.padH,
                  itemBuilder: (_, index) {
                    CartData product = products[index];
                    int quantity = (product.quantity ?? 0);

                    num price = (product.price ?? 0) * quantity;

                    return OrderTile(
                      product: product,
                      price: price,
                      userData: userData[index],
                      quantity: quantity,
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
