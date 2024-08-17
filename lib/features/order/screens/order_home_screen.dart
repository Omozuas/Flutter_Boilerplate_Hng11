import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/string_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/widgets/custom_button.dart';
import '../models/cart_model.dart';
import '../widgets/cart_price_option.dart';
import '../widgets/cart_product_widget.dart';

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

  num totalPrice = 0;
  num allPrice = 0;
  num discountedPrice = 0;
  num deliveryFee = 1500;
  num payPrice = 0;

  notifyListeners() {
    setState(() {});
  }

  getPrice() {
    totalPrice = products.fold(
        0, (sum, item) => sum + ((item.quantity ?? 0) * (item.price ?? 0)));
    allPrice = products.fold(
        0, (sum, item) => sum + ((item.quantity ?? 0) * (item.price ?? 0)));
    discountedPrice =
    promoCodeController.text
        .trim()
        .isEmpty ? 0 : (totalPrice * (5 / 100));
    payPrice = (totalPrice + deliveryFee) - discountedPrice;
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
        centerTitle: true,
        title: Text("Orders"),
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
    padding: 16.h.padH,
    itemBuilder: (_, index) {
    CartData product = products[index];
    int quantity = (product.quantity ?? 0);

    num price = (product.price ?? 0) * quantity;

  


    return OrderWidget(
    price: price,
    quantity: quantity,
    isLast: product == products.last,
    image: product.image ?? "",
    name: product.name ?? "",
    description: product.description ?? "",
    orderBy: "User 1",
    orderStatus: "Sent",
    );
    }),
    Padding(
    padding: 16.sp.padA,
    child: Column(
    children: [
    CartPriceOption(
    title: "Total Orders",
    value: totalPrice,
    ),
    50.h.sbH,
    ],
    ),
    )
    ],
    )
    ,
    );
  }
}
