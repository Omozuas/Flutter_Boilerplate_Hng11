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

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_hng11/services/response_model.dart';

class DioProvider {
  final Dio _dio;
  String? _accessToken;

  DioProvider()
      : _dio = Dio(BaseOptions(
          baseUrl: 'base_url',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          responseType: ResponseType.json,
        ));

  void updateAccessToken(String token) {
    _accessToken = token;
    _dio.options.headers['Authorization'] = 'Bearer $_accessToken';
  }

  Future post(String path, {Map? data}) async {
    try {
      var response = await _dio.post(path, data: data);
      return ResponseModel.fromJson(response.data);
    } catch (e) {
      debugPrint("ERROR ${e.toString()}");
    }
  }

  Future multipart(String path, {Map? data}) async {
    try {
      final formData = FormData.fromMap(data as Map<String, dynamic>);
      var response = await _dio.post(path, data: formData);
      return ResponseModel.fromJson(response.data);
    } catch (e) {
      debugPrint("ERROR ${e.toString()}");
    }
  }

  Future putUpdate(String path, {Map? data}) async {
    try {
      var response = await _dio.put(path, data: data);
      return ResponseModel.fromJson(response.data);
    } catch (e) {
      debugPrint("ERROR ${e.toString()}");
    }
  }

  Future patchUpdate(String path, {Map? data}) async {
    try {
      var response = await _dio.patch(path, data: data);
      return ResponseModel.fromJson(response.data);
    } catch (e) {
      debugPrint("ERROR ${e.toString()}");
    }
  }

  Future get(String path, {Map<String, dynamic>? query}) async {
    try {
      var response = await _dio.get(path, queryParameters: query);
      return ResponseModel.fromJson(response.data);
    } catch (e) {
      debugPrint("ERROR ${e.toString()}");
    }
  }

  Future delete(String path, {Map? data}) async {
    try {
      var response = await _dio.delete(path, data: data);
      return ResponseModel.fromJson(response.data);
    } catch (e) {
      debugPrint("ERROR ${e.toString()}");
    }
  }
}
