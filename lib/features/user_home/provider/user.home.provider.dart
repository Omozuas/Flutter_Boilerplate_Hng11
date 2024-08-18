import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_hng11/features/home/home_widget/dashboard_api.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/models/product/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../services/service_locator.dart';
import '../../../../services/user.service.dart';

class DashBoardState {
  final bool isLoading;
  final List<Product> allProducts;
  final List<Product> displayedProducts;

  DashBoardState({
    required this.isLoading,
    required this.allProducts,
    required this.displayedProducts
  });

  DashBoardState copyWith({
    bool? isLoading,
    List<Product>? allProducts,
    List<Product>? displayedProducts,
  }) {
    return DashBoardState(
      isLoading: isLoading ?? this.isLoading,
      allProducts: allProducts ?? [],
      displayedProducts: displayedProducts ?? [],
    );
  }
}

class UserDashBoardProvider extends StateNotifier<DashBoardState> {
  final GetStorage _storageService = locator<GetStorage>();
  UserService userService = locator<UserService>();
  TextEditingController searchController = TextEditingController();

  UserDashBoardProvider()
    : super(DashBoardState(
    isLoading: false,
    allProducts: [],
    displayedProducts: [],
  )) {
    // Initialize the provider by getting cached data and then fetching fresh data
    _initializeDashboardData();
  }

  Future<void> _initializeDashboardData() async {
    // Step 1: Get cached data if available
    await getCachedAllProduct();

    // Step 2: Fetch fresh data from the service
    await getAllProduct();
  }

  List<Product> products = [];
  List<Product> displayedProducts = [];

  searchProduct(String? val){
    String value = val??"";
    if(value.isEmpty){
      setDisplayProducts = state.allProducts;
      displayedProducts = products;
    }else if(displayedProducts.isEmpty){
      setDisplayProducts = [];
      displayedProducts = [];
    }else{
      setDisplayProducts = state.allProducts.where(
        (product)=> (product.name??"").toLowerCase().contains(value.toLowerCase())
      ).toList();
      displayedProducts = products.where(
        (product)=> (product.name??"").toLowerCase().contains(value.toLowerCase())
      ).toList();

    }
    log("state displayed ::: ${state.displayedProducts.length.toString()}");
  }

  set setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  set setAllProducts(List<Product> value) {
    state = state.copyWith(allProducts: value);
    products = value;
    log("Newwwww::: ${products.length}");
    // Ensure that displayedProducts is updated whenever allProducts is updated
    searchProduct(searchController.text);
  }

  set setDisplayProducts(List<Product> value) {
    state = state.copyWith(displayedProducts: value);
  }



  Future<void> getAllProduct({int? pageSize, int? page}) async {
    setIsLoading = true; // Start loading
    try {
      final res = await DashboardApi().getAllProducts(pageSize: pageSize, page: page);
      log("ALL Products::: ${res.length}");
      if (res.isNotEmpty) {
        setAllProducts = res; // Update state with fetched products
        await saveAllProducts(res); // Save to storage
        log("State saved ::: ${state.allProducts.length.toString()}");
        searchProduct(""); // Ensure this updates displayedProducts
      }

    } catch (e) {
      log("Error fetching products: $e");
    } finally {
      setIsLoading = false; // Stop loading
    }
  }


  Future<void> getCachedAllProduct() async {
    // Store(AllProducts)
    try {
      final res = _storageService.read("all_products");
      if (res != null) {
        setAllProducts = getProductListFromStringtoJson(res);
        searchProduct("");
      }
    } catch (e) {
      //tODO: Do something with caught error;
    } finally {
      // setNormalButtonLoading = false;
    }
  }

  Future<bool> saveAllProducts(List<Product> value) async {
    try {
      _storageService.write("all_products", getProductListFromJsontoString(value));
      bool res = _storageService.hasData("all_products");
      if (res) {
        return true;
      }
      return false;
    } catch (err) {
      return false;
    }
  }

}

final userDashBoardProvider =
StateNotifierProvider<UserDashBoardProvider, DashBoardState>((ref) {
  return UserDashBoardProvider();
});

//final checkBoxState = StateProvider<bool>((ref) => false);
// final loadingGoogleButton = StateProvider<bool>((ref) => false);
