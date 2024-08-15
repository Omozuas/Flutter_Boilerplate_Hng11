import 'package:dio/dio.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/models/product.dart';

import '../../services/dio_provider.dart';
import '../../services/service_locator.dart';

class ProductApi {
  DioProvider dioProvider = locator<DioProvider>();
  final dio = Dio();

  Future<List<Product>> fetchProducts(
      {String page = '1', String pageSize = '10'}) async {
    try {
      final response = await dio.get(
          'https://staging.api-nestjs.boilerplate.hng.tech/api/v1/products?page=$page&page_size=$pageSize');
          
      if (response.statusCode == 200) {
        final products = (response.data['data']['products'] as List)
            .cast<Map<String, dynamic>>();
        return products.map(Product.fromMap).toList();
      }
      throw Exception('Failed to fetch products');
    } catch (e) {
      rethrow;
    }
  }

  Future<Product> fetchProductDetails(String id) async {
    try {
      final response = await dio.get(
          'https://staging.api-nestjs.boilerplate.hng.tech/api/v1/products?product_id=$id');
      if (response.statusCode == 200) {
        final products = (response.data['data']['products'] as List)
            .cast<Map<String, dynamic>>();

        final foundProduct = products.where((product) {
          return product['id'] == id;
        }).toList();

        final product = Product.fromMap(foundProduct.first);
        return product;
      }
      throw Exception('Failed to fetch products');
    } catch (e) {
      rethrow;
    }
  }
}
