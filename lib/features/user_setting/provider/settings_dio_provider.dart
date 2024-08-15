import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/custom_interceptor.dart';
import '../models/custom_api_error.dart';

typedef DioResponseData = Map<String, dynamic>;

class SettingsDioProvider {
  final Dio _dio;

  SettingsDioProvider()
      : _dio = Dio(BaseOptions(
          baseUrl: dotenv.env['BASE_URL']!,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          responseType: ResponseType.json,
        ))
          ..interceptors.add(CustomInterceptor());

  // void updateAccessToken(String token) {
  //   _accessToken = token;
  //   _dio.options.headers['Authorization'] = 'Bearer $_accessToken';
  // }

  // Future post(String path, {Map? data}) async {
  //   try {
  //     var response = await _dio.post(path, data: data);
  //     return ResponseModel.fromJson(response.data);
  //   } catch (e) {
  //     //  ErrorHandlers.allErrorHandler(e);
  //   }
  // }

  // Future multipart(String path, {Map? data}) async {
  //   try {
  //     final formData = FormData.fromMap(data as Map<String, dynamic>);
  //     final response = await _dio.post(path, data: formData);
  //     return ResponseModel.fromJson(response.data);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future putUpdate(String path, {Map? data}) async {
  //   try {
  //     var response = await _dio.put(path, data: data);
  //     return ResponseModel.fromJson(response.data);
  //   } catch (e) {
  //     ErrorHandlers.allErrorHandler(e);
  //   }
  // }

  // Future patchUpdate(String path, {Map? data}) async {
  //   try {
  //     final response = await _dio.patch(path, data: data);
  //     // return ResponseModel.fromJson(response.data);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<DioResponseData> get(String path,
      {Map<String, dynamic>? query}) async {
    try {
      final response = await _dio.get(path, queryParameters: query);
      final errorMessage = _checkStatus(response.statusCode);
      if (errorMessage != null) {
        throw CustomApiError(errorMessage);
      }
      return response.data as DioResponseData;
    } catch (e) {
      rethrow;
    }
  }

  // Future delete(String path, {Map? data}) async {
  //   try {
  //     var response = await _dio.delete(path, data: data);
  //     return ResponseModel.fromJson(response.data);
  //   } catch (e) {
  //     ErrorHandlers.allErrorHandler(e);
  //   }
  // }

  String? _checkStatus(int? code) {
    if (code == 200) {
      return null;
    }
    if (code == 401) {
      return 'Unauthorized request. Please login.';
    }
    if (code == 404) {
      return 'Could\'nt find the resource';
    }
    return 'An error occurred';
  }
}

final settingsDioProvider = Provider<SettingsDioProvider>((ref) {
  return SettingsDioProvider();
});
