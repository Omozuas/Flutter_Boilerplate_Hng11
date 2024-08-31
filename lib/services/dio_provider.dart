// import 'package:dio/dio.dart';
// import 'response_model.dart';
//
//
//
// class ApiService {
//   final String baseUrl;
//   final Dio _dio;
//
//   ApiService._internal(this.baseUrl) : _dio = Dio(BaseOptions(baseUrl: baseUrl));
//
//   static ApiService? _instance;
//
//   factory ApiService({required String baseUrl}) {
//     return _instance ??= ApiService._internal(baseUrl);
//   }
//
//   Future<ResponseModel?> postRequest(String endpoint, Map<String, dynamic> body) async {
//     try {
//       final response = await _dio.post(endpoint, data: body);
//
//       if (response.statusCode == 200) {
//         return ResponseModel.fromJson(response.data);
//       } else {
//         return null;
//       }
//     } on DioException catch (e) {
//       print('Error in POST request: ${e.message}');
//       return null;
//     }
//   }
//
//   Future<ResponseModel?> getRequest(String endpoint) async {
//     try {
//       final response = await _dio.get(endpoint);
//
//       if (response.statusCode == 200) {
//         return ResponseModel.fromJson(response.data);
//       } else {
//         return null;
//       }
//     } on DioException catch (e) {
//       print('Error in GET request: ${e.message}');
//       return null;
//     }
//   }
//
//   Future<ResponseModel?> updateRequest(String endpoint, Map<String, dynamic> body) async {
//     try {
//       final response = await _dio.put(endpoint, data: body);
//
//       if (response.statusCode == 200) {
//         return ResponseModel.fromJson(response.data);
//       } else {
//         return null;
//       }
//     } on DioException catch (e) {
//       print('Error in POST request: ${e.message}');
//       return null;
//     }
//   }
//
// }

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate_hng11/services/custom_interceptor.dart';
import 'package:flutter_boilerplate_hng11/services/response_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioProvider {
  final Dio _dio;

  DioProvider()
      : _dio = Dio(BaseOptions(
          baseUrl: dotenv.env['BASE_URL']!,
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
          responseType: ResponseType.json,
        ))
          ..interceptors.add(CustomInterceptor());

  Future<ResponseModel?> post(String path, {Map? data}) async {
    var response = await _dio.post(path, data: data);
    return ResponseModel.fromJson(response.data);
  }

  Future<ResponseModel?> multipart(String path, {Map? data}) async {
    final formData = FormData.fromMap(data as Map<String, dynamic>);
    var response = await _dio.post(path, data: formData);
    return ResponseModel.fromJson(response.data);
  }

  Future<ResponseModel?> multipartPut(
    String path, {
    Options? options,
    required Map<String, dynamic> data,
  }) async {
    final formData = FormData.fromMap(data);
    var response = await _dio.put(
      path,
      data: formData,
      options: options,
    );

    return ResponseModel.fromJson(response.data);
  }

  Future<ResponseModel?> putUpdate(String path, {Map? data}) async {
    var response = await _dio.put(path, data: data);
    return ResponseModel.fromJson(response.data);
  }

  Future<ResponseModel?> patchUpdate(String path, {Map? data}) async {
    var response = await _dio.patch(path, data: data);
    return ResponseModel.fromJson(response.data);
  }

  Future<ResponseModel?> get(String path,
      {Map<String, dynamic>? query, Options? options}) async {
    var response =
        await _dio.get(path, queryParameters: query, options: options);
    return ResponseModel.fromJson(response.data);
  }

  Future<ResponseModel?> delete(String path, {Map? data}) async {
    var response = await _dio.delete(path, data: data);
    return ResponseModel.fromJson(response.data);
  }
}
