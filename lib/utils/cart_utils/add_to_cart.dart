import 'dart:developer';

import 'package:flutter_boilerplate_hng11/features/product_listing/models/product/product_model.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:flutter_boilerplate_hng11/utils/cart_utils/cart_functions.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_snackbar.dart';
import 'package:get_storage/get_storage.dart';

Future<bool> addItemToCart(Product product)async{
  GetStorage storage = locator<GetStorage>();
  var data = await getCartItems();
  try{
    if(data.isEmpty){
      storage.write("cart_items", getProductListFromJsontoString([product]));
      return true;
    }else{
      if(data.any((cart)=> cart.id == product.id)){
        showSnackBar("Item already in cart");
        return false;
      }else{
        storage.write("cart_items", getProductListFromJsontoString([...data, product]));
        return true;
      }
    }
  }catch(err){
    log(err.toString());
    return false;
  }
}