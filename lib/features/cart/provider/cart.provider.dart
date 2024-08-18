import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/models/product/product_model.dart';
import 'package:flutter_boilerplate_hng11/utils/cart_utils/cart_functions.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_snackbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartState {
  final bool cartLoading;
  final List<Product> allCart;

  CartState({
    required this.cartLoading,
    required this.allCart,
  });

  CartState copyWith({
    bool? cartLoading,
    List<Product>? allCart
  }) {
    return CartState(
    cartLoading: cartLoading ?? this.cartLoading,
    allCart: allCart ?? this.allCart,
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
  )) {
    // Initialize the provider by getting cached data and then fetching fresh data
    getAllCartItems();
  }

  onChanged(String? val){

  }

  num totalPrice = 0;
  num allPrice = 0;
  num discountedPrice = 0;
  num deliveryFee = 1500;
  num payPrice = 0;
  TextEditingController promoCodeController = TextEditingController();

  updateItem(Product item, int quanity) async {
    updateToCart(item, quanity);
    await getCartItems();
  }

  removeItem(int index) async {
    removeCartItemFromDb(index);
    await getCartItems();
  }


  getPrice() {
    totalPrice = state.allCart.fold(
        0, (sum, item) => sum + ((item.quantity ?? 0) * (item.price ?? 0)));
    allPrice = state.allCart.fold(
        0, (sum, item) => sum + ((item.quantity ?? 0) * (item.price ?? 0)));
    discountedPrice =
    promoCodeController.text.trim().isEmpty ? 0 : (totalPrice * (5 / 100));
    payPrice = (totalPrice + deliveryFee) - discountedPrice;
  }


  set setCartLoading(bool value) {
    state = state.copyWith(cartLoading: value);
  }

  set setAllCart(List<Product> value) {
    state = state.copyWith(allCart: value);
  }

  List<Product> cartItems =[];

  Future<void> getAllCartItems() async {
    setCartLoading = true;
    try {
      final res = await getCartItems();
      if (res.isNotEmpty) {
        setAllCart = res;
        cartItems = res;
        getPrice();
      }
      setAllCart = [];
    } catch (e) {
      //tODO: Do something with caught error;
    } finally {
      setCartLoading = false;
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
      var res = await updateToCart(product, quantity);
      if(res){
        await getAllCartItems();
        showSnackBar("${product.name} added to cart");
      }
      showSnackBar("Error updating ${product.name} to cart");
    }catch(e){
      log(e.toString());
      showSnackBar("Error updating ${product.name} to cart");
    } finally{

    }
  }

}

