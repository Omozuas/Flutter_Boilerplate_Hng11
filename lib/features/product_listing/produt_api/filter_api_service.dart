import 'package:dio/dio.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/models/filter_product_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _dio.get(
          'https://staging.api-nestjs.boilerplate.hng.tech/api/v1/products');
      final List<dynamic> data = response.data['data'];
      return data.map((productJson) => Product.fromJson(productJson)).toList();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }
}
