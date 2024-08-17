import 'dart:developer';

import 'package:flutter_boilerplate_hng11/features/product_listing/models/product/product_model.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:get_storage/get_storage.dart';

Future<List<Product>> getCartItems() async{
  GetStorage storage = locator<GetStorage>();
  try{
    String? cartItems = storage.read("cart_items");
    if(cartItems!=null){
      return getProductListFromStringtoJson(cartItems);
    }
    return [];
  }catch(err){
    log(err.toString());
    return [];
  }
}