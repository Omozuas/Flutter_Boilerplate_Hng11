// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'response_model.dart';

class ApiService {
  final String baseUrl;
  final Dio _dio;

  ApiService._internal(this.baseUrl)
      : _dio = Dio(BaseOptions(baseUrl: baseUrl));

  static ApiService? _instance;

  factory ApiService({required String baseUrl}) {
    return _instance ??= ApiService._internal(baseUrl);
  }

  Future<ResponseModel?> postRequest(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await _dio.post(endpoint, data: body);

      if (response.statusCode == 200) {
        return ResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      print('Error in POST request: ${e.message}');
      return null;
    }
  }

  Future<ResponseModel?> getRequest(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);

      if (response.statusCode == 200) {
        return ResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      print('Error in GET request: ${e.message}');
      return null;
    }
  }

  Future<ResponseModel?> updateRequest(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await _dio.put(endpoint, data: body);

      if (response.statusCode == 200) {
        return ResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      print('Error in POST request: ${e.message}');
      return null;
    }
  }
}
