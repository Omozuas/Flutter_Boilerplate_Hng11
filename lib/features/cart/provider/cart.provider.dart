import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/models/product/product_model.dart';
import 'package:flutter_boilerplate_hng11/utils/cart_utils/cart_functions.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_snackbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartState {
  final bool cartLoading;
  final List<Product> allCart;
  final num totalPrice;
  final num allPrice;
  final num discountedPrice;
  final num payPrice;
  final num deliveryFee;

  CartState({
    required this.cartLoading,
    required this.allCart,
    required this.totalPrice,
    required this.allPrice,
    required this.discountedPrice,
    required this.payPrice,
    required this.deliveryFee,
  });

  CartState copyWith({
    bool? cartLoading,
    List<Product>? allCart,
    num? totalPrice,
    num? allPrice,
    num? discountedPrice,
    num? payPrice,
    num? deliveryFee,
  }) {
    return CartState(
    cartLoading: cartLoading ?? this.cartLoading,
    allCart: allCart ?? this.allCart,
    deliveryFee: deliveryFee ?? this.deliveryFee,
    payPrice: payPrice ?? this.payPrice,
    discountedPrice: discountedPrice ?? this.discountedPrice,
    allPrice: allPrice ?? this.allPrice,
    totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}

final cartProvider =
StateNotifierProvider<CartProvider, CartState>((ref) {
  return CartProvider();
});

class CartProvider extends StateNotifier<CartState> {

  CartProvider()
      : super(CartState(
    cartLoading: false,
    allCart: [],
    totalPrice: 0,
    allPrice: 0,
    discountedPrice: 0,
    deliveryFee: 1500,
    payPrice: 0,
  ));

  onChanged(String? val){

  }


  TextEditingController promoCodeController = TextEditingController();

  removeItem(int index) async {
    removeCartItemFromDb(index);
    await getCartItems();
  }

  set setTotalPrice(num value) {
    state = state.copyWith(totalPrice: value);
  }

  set setAllPrice(num value) {
    state = state.copyWith(allPrice: value);
  }

  set setDiscountedPrice(num value) {
    state = state.copyWith(discountedPrice: value);
  }

  set setPayPrice(num value) {
    state = state.copyWith(payPrice: value);
  }


  getPrice() {
    setTotalPrice = state.allCart.fold(
        0, (sum, item) => sum + ((item.cartQuantity ?? 0) * (item.price ?? 0)));
    setAllPrice = state.allCart.fold(
        0, (sum, item) => sum + ((item.cartQuantity ?? 0) * (item.price ?? 0)));
    setDiscountedPrice = promoCodeController.text.trim().isEmpty ? 0 : (state.totalPrice * (5 / 100));
    setPayPrice = (state.totalPrice + state.deliveryFee) - state.discountedPrice;
  }


  set setCartLoading(bool value) {
    state = state.copyWith(cartLoading: value);
  }

  set setAllCart(List<Product> value) {
    state = state.copyWith(allCart: value);
  }

  List<Product> cartItems =[];

  Stream<List<Product>> getAllCartItems() async* {
    while(true){
      try {
        final res = await getCartItems();
        if (res.isNotEmpty) {
          setAllCart = res;
          cartItems = res;
          getPrice();
          yield res;
        }
        else{
          setAllCart = [];
          yield [];
        }

      } catch (e) {
        //tODO: Do something with caught error;
      }
      await Future.delayed(const Duration(seconds: 10));
    }

  }

  Future<void> removeFromCart() async {
    try {
      // final res = await DashboardApi().getOrganizationOverView();
      // if (res.overview != null) {
      //   await saveOrganizationOverview(res);
      // }
      // setOrganizationOverView = res;
    } catch (e) {
      //tODO: Do something with caught error;
    } finally {
      // setOverViewLoading = false;
    }
  }

  updateCart(Product product, int quantity)async{
    try{
      Product newProduct = product.copyWith(
        cartQuantity: quantity
      );
      var res = await updateToCart(newProduct);
    }catch(e){
      log(e.toString());
      showSnackBar("Error updating ${product.name} to cart");
    } finally{

    }
  }

}

