import 'dart:developer';

import 'package:flutter_boilerplate_hng11/features/product_listing/models/product/product_model.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:flutter_boilerplate_hng11/utils/cart_utils/cart_functions.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_snackbar.dart';
import 'package:get_storage/get_storage.dart';

Future<bool> updateToCart(Product product) async {
  GetStorage storage = locator<GetStorage>();
  var data = await getCartItems();
  try {
    if (data.isEmpty) {
      showSnackBar("Cart is empty");
      return false;
    }else{
      if(data.any((cart)=> cart.id == product.id)){
        int index = data.indexWhere((e)=> e.id == product.id);
        data[index] = product;
        storage.write("cart_items", getProductListFromJsontoString(data));
        return true;
      }else {
        showSnackBar("Item not in cart");
        return false;
      }
    }
  } catch (err) {
    log(err.toString());
    return false;
  }
}
