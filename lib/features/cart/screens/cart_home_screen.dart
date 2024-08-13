import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/widgets/price_text_widget.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/widgets/custom_button.dart';
import '../widgets/cart_add-remove_button.dart';
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

  List<Map<String, dynamic>> data = [
    {
      "image": "https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg",
      "name": "Burger",
      "quantity": 1,
      "price": 10,
      "description": "This is a delicious cheese burger"
    },
    {
      "image": "https://www.foodiesfeed.com/wp-content/uploads/2023/09/fresh-vegetables.jpg",
      "name": "Fruits",
      "quantity": 1,
      "price": 15,
      "description": "Fruits are good for the health please endevour to eat them"
    },
    {
      "image": "https://www.foodiesfeed.com/wp-content/uploads/2023/10/bowl-of-ice-cream-with-chocolate.jpg",
      "name": "Ice cream",
      "quantity": 1,
      "price": 21,
      "description": "A nice bowl of ice cream to cure your cravings"
    },
    {
      "image": "https://www.foodiesfeed.com/wp-content/uploads/2023/08/grilled-crispy-pork-with-rice.jpg",
      "name": "Rice and Meat Sauce",
      "quantity": 1,
      "price": 65,
      "description": "Freshly cooked rice and meat source with cucumber and lettus"
    },
  ];

  List<Map<String, dynamic>> products =[];

  List<Map<String, dynamic>> selectedProducts =[];

  removeItem(int index){
    setState(() {
      products.removeAt(index);
    });
  }

  onChanged(String? val){
    setState(() {});
  }

  selectItem(Map<String, dynamic> product){
    if(selectedProducts.any((e)=> e == product)){
      selectedProducts.removeWhere((e)=> e == product);
    }else{
      selectedProducts.add(product);
    }
    setState(() {});
  }


  @override
  void initState() {
    products = data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(selectedProducts.isEmpty? "My Cart": "${selectedProducts.length} Selected", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),),
        actions: [
          PopupMenuButton<String>(
            child: Container(
              padding: 10.sp.padA,
              child: const Icon(Icons.more_vert),
            ),
            onSelected: (value) {

            },
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
          Divider(color: const Color(0xFFDEDEDE), height: 1.h,),
          Expanded(
            child: ListView(
              children: [
                ListView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: 16.h.padH,
                  itemBuilder: (_, index){

                    Map<String, dynamic> product = products[index];
                    int quantity = (product["quantity"]??0);

                    num price = (product["price"]??0) * quantity;

                    return CartWidget(
                      price: price,
                      isSelected: selectedProducts.any((e)=> e == product),
                      quantity: quantity,
                      isLast: product == products.last,
                      image: product["image"],
                      name: product["name"],
                      description: product["description"],
                      selectItem: ()=> selectItem(product),
                      removeItem: ()=> removeItem(index),
                    );
                  }
                ),
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
                              onChanged: onChanged,
                            ),
                          ),
                          16.w.sbW,
                          Custombutton(
                            borderColor: Colors.transparent,
                            text: "Apply",
                            height: 34.h,
                            containerColor: promoCodeController.text.trim().isEmpty? GlobalColors.orange.withOpacity(0.5): GlobalColors.orange,
                            width: 133.w,
                            textColor: Colors.white,
                            onTap: (){},
                          )
                        ],
                      ),
                      16.h.sbH,
                      const CartPriceOption(
                        title: "Sub Total",
                        value: 38,
                      ),
                      const CartPriceOption(
                        title: "Delivery Fee",
                        value: 150,
                      ),
                      const CartPriceOption(
                        title: "Discount",
                        value: 10,
                      ),
                      30.h.sbH,
                      Custombutton(
                        borderColor: Colors.transparent,
                        text: "Checkout \$198.00",
                        height: 48.h,
                        containerColor: GlobalColors.orange,
                        width: width(context),
                        fontWeight: FontWeight.w600,
                        textColor: Colors.white,
                        onTap: (){},
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
