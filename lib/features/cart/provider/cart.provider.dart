import 'dart:developer';

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



  set setCartLoading(bool value) {
    state = state.copyWith(cartLoading: value);
  }

  set setAllCart(List<Product> value) {
    state = state.copyWith(allCart: value);
  }

  Future<void> getAllCartItems() async {
    setCartLoading = true;
    try {
      final res = await getCartItems();
      if (res.isNotEmpty) {
        setAllCart = res;
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

