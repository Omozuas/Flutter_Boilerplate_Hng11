import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/string_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/global_size.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/widgets/custom_button.dart';
import '../models/cart_model.dart';
import '../widgets/cart_price_option.dart';
import '../widgets/cart_product_widget.dart';

class CartHomeScreen extends StatefulWidget {
  const CartHomeScreen({super.key});

  @override
  State<CartHomeScreen> createState() => _CartHomeScreenState();
}

class _CartHomeScreenState extends State<CartHomeScreen> {
  TextEditingController promoCodeController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<CartData> data = [
    // CartData(
    //     image:
    //         "https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg",
    //     name: "Burger",
    //     quantity: 1,
    //     price: 10,
    //     description: "This is a delicious cheese burger"),
    // CartData(
    //     image:
    //         "https://www.foodiesfeed.com/wp-content/uploads/2023/09/fresh-vegetables.jpg",
    //     name: "Fruits",
    //     quantity: 1,
    //     price: 15,
    //     description:
    //         "Fruits are good for the health please endevour to eat them"),
    // CartData(
    //     image:
    //         "https://www.foodiesfeed.com/wp-content/uploads/2023/10/bowl-of-ice-cream-with-chocolate.jpg",
    //     name: "Ice cream",
    //     quantity: 1,
    //     price: 21,
    //     description: "A nice bowl of ice cream to cure your cravings"),
    // CartData(
    //     image:
    //         "https://www.foodiesfeed.com/wp-content/uploads/2023/08/grilled-crispy-pork-with-rice.jpg",
    //     name: "Rice and Meat Sauce",
    //     quantity: 1,
    //     price: 65,
    //     description:
    //         "Freshly cooked rice and meat source with cucumber and lettus"),
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
        promoCodeController.text.trim().isEmpty ? 0 : (totalPrice * (5 / 100));
    payPrice = (totalPrice + deliveryFee) - discountedPrice;
    notifyListeners();
  }

  updateItem(CartData item, int index) async {
    products[index] = item;
    getPrice();
    notifyListeners();
  }

  List<CartData> products = [];

  List<CartData> selectedProducts = [];

  removeItem(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  onChanged(String? val) {
    setState(() {});
  }

  selectItem(CartData product) {
    if (selectedProducts.any((e) => e == product)) {
      selectedProducts.removeWhere((e) => e == product);
    } else {
      selectedProducts.add(product);
    }
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
        title: Text(
          selectedProducts.isEmpty
              ? "My Cart"
              : "${selectedProducts.length} Selected",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        actions: [
          PopupMenuButton<String>(
            child: Container(
              padding: 10.sp.padA,
              child: const Icon(Icons.more_vert),
            ),
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: Text("My Cart"),
                ),
              ];
            },
          )
        ],
      ),
      body: Column(
        children: [
          Divider(
            color: const Color(0xFFDEDEDE),
            height: 1.h,
          ),
          products.isEmpty
              ? Padding(
                  padding: EdgeInsets.only(
                      top: GlobalScreenSize.getScreenHeight(context) * 0.4),
                  child: const Text("Add Item to cart"),
                )
              : Expanded(
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

                            subtractQuantity() {
                              if (quantity == 1) {
                                // showCustomToast("You can't go below this, delete item if not needed");
                              } else {
                                quantity -= 1;
                                product.updateQuantity(quantity);
                                updateItem(product, index);
                              }
                            }

                            addQuantity() {
                              quantity += 1;
                              product.updateQuantity(quantity);
                              updateItem(product, index);
                            }

                            return CartWidget(
                              price: price,
                              isSelected:
                                  selectedProducts.any((e) => e == product),
                              quantity: quantity,
                              isLast: product == products.last,
                              image: product.image ?? "",
                              name: product.name ?? "",
                              description: product.description ?? "",
                              selectItem: () => selectItem(product),
                              removeItem: () => removeItem(index),
                              addQuantity: addQuantity,
                              reduceQuantity: subtractQuantity,
                            );
                          }),
                      Padding(
                        padding: 16.sp.padA,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    controller: promoCodeController,
                                    hintText: "Promo Code",
                                    onchanged: onChanged,
                                  ),
                                ),
                                16.w.sbW,
                                CustomButton(
                                  borderColor: Colors.transparent,
                                  text: "Apply",
                                  height: 34.h,
                                  borderColors: GlobalColors.orange,
                                  containerColor:
                                      promoCodeController.text.trim().isEmpty
                                          ? GlobalColors.orange.withOpacity(0.5)
                                          : GlobalColors.orange,
                                  width: 133.w,
                                  textColor: Colors.white,
                                  onTap: getPrice,
                                )
                              ],
                            ),
                            16.h.sbH,
                            CartPriceOption(
                              title: "Sub Total",
                              value: totalPrice,
                            ),
                            CartPriceOption(
                              title: "Delivery Fee",
                              value: deliveryFee,
                            ),
                            CartPriceOption(
                              title: "Discount",
                              value: discountedPrice,
                            ),
                            16.h.sbH,
                            CustomButton(
                              borderColor: Colors.transparent,
                              text:
                                  "Checkout \$1${formatNumber(payPrice, decimalPlaces: 2)}",
                              height: 48.h,
                              containerColor: GlobalColors.orange,
                              borderColors: GlobalColors.orange,
                              width: width(context),
                              fontWeight: FontWeight.w600,
                              textColor: Colors.white,
                              onTap: () {},
                            )
                          ],
                        ),
                      ),
                      50.h.sbH,
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
