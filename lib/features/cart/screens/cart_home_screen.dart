import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/string_extensions.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/models/product/product_model.dart';
import 'package:flutter_boilerplate_hng11/utils/Styles/text_styles.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/widgets/custom_button.dart';
import '../provider/cart.provider.dart';
import '../widgets/cart_price_option.dart';
import '../widgets/cart_product_widget.dart';

class CartHomeScreen extends ConsumerWidget {
  const CartHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);
    final cartDataProvider = ref.read(cartProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Cart",
          style: CustomTextStyles.titleTextBlack,
        ),
        actions: [
          PopupMenuButton<String>(
            child: Container(
              padding: 10.sp.padA,
              child: const Icon(Icons.more_vert),
            ),
            onSelected: (value) {
              // Handle menu item selection
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: Text("Delete"),
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
          Expanded(
            child: cartState.allCart.isEmpty? const Center(
              child: Text("No item in cart"),
            ):
            ListView.builder(
              itemCount: cartState.allCart.length,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemBuilder: (context, index) {
                Product product = cartDataProvider.cartItems[index];
                int quantity = product.quantity ?? 0;

                void updateCartQuantity(Product product, int quantity) {
                  final updatedProduct = product.copyWith(cartQuantity: quantity);
                  // Further logic to handle updatedProduct
                }

                num price = (product.price ?? 0) * quantity;

                subtractQuantity() {
                  if (quantity == 1) {
                    // showCustomToast("You can't go below this, delete item if not needed");
                  } else {
                    quantity -= 1;
                    updateCartQuantity(product, quantity);
                  }
                }

                addQuantity() {
                  quantity += 1;
                  updateCartQuantity(product, quantity);
                }

                return CartWidget(
                  price: price,
                  isSelected: false,
                  quantity: quantity,
                  isLast: index == (cartState.allCart.length - 1),
                  image: product.image ?? "",
                  name: product.name ?? "",
                  description: product.description ?? "",
                  selectItem: () {},
                  removeItem: () => cartDataProvider.removeItem(index),
                  addQuantity: addQuantity,
                  reduceQuantity: subtractQuantity,
                );
              },
            ),
          ),
          if (cartState.allCart.isNotEmpty) ...[
            Padding(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: cartDataProvider.promoCodeController,
                          hintText: "Promo Code",
                          onchanged: cartDataProvider.onChanged,
                          margin: EdgeInsets.zero,
                        ),
                      ),
                      16.w.sbW,
                      CustomButton(
                        borderColor: Colors.transparent,
                        text: "Apply",
                        height: 50.h,
                        borderColors: GlobalColors.orange,
                        containerColor: cartDataProvider.promoCodeController.text.trim().isEmpty
                            ? GlobalColors.orange.withOpacity(0.5)
                            : GlobalColors.orange,
                        width: 133.w,
                        textColor: Colors.white,
                        onTap: cartDataProvider.getPrice,
                      ),
                    ],
                  ),
                  16.h.sbH,
                  CartPriceOption(
                    title: "Sub Total",
                    value: cartDataProvider.totalPrice,
                  ),
                  CartPriceOption(
                    title: "Delivery Fee",
                    value: cartDataProvider.deliveryFee,
                  ),
                  CartPriceOption(
                    title: "Discount",
                    value: cartDataProvider.discountedPrice,
                  ),
                  16.h.sbH,
                  CustomButton(
                    borderColor: Colors.transparent,
                    text: "Checkout \$${formatNumber(cartDataProvider.payPrice, decimalPlaces: 2)}",
                    height: 55.h,
                    containerColor: GlobalColors.orange,
                    borderColors: GlobalColors.orange,
                    width: width(context),
                    fontWeight: FontWeight.w600,
                    textColor: Colors.white,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
          50.h.sbH,
        ],
      ),
    );
  }
}

