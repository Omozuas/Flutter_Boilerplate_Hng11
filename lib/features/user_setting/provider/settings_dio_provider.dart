import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

import '../../../services/service_locator.dart';
import '../models/custom_api_error.dart';

typedef DioResponseData = Map<String, dynamic>;

class SettingsDioProvider {
  late final Dio _dio;

  SettingsDioProvider() {
    final box = locator<GetStorage>();
    _dio = Dio(BaseOptions(
      headers: {'Authorization': 'Bearer ${box.read('accessToken')}'},
      baseUrl: dotenv.env['BASE_URL']!,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      responseType: ResponseType.json,
    ));
  }

  Future<DioResponseData> get(String path,
      {Map<String, dynamic>? query}) async {
    try {
      final response = await _dio.get(path);
      return response.data as DioResponseData;
    } on DioException catch (e) {
      final errorMessage = _checkStatus(e.response!.statusCode!)!;
      throw CustomApiError(errorMessage);
    } catch (e) {
      throw CustomApiError('An error occurred');
    }
  }

  Future<DioResponseData> post(
    String path, {
    Map? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response =
          await _dio.post(path, data: data, queryParameters: queryParameters);
      return response.data as DioResponseData;
    } on DioException catch (e) {
      final errorMessage = _checkStatus(e.response!.statusCode!)!;
      throw CustomApiError(errorMessage);
    } catch (e) {
      throw CustomApiError('An error occurred');
    }
  }

  Future put(
    String path, {
    Map? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response =
          await _dio.put(path, data: data, queryParameters: queryParameters);
      return response.data as DioResponseData;
    } on DioException catch (e) {
      final errorMessage = _checkStatus(e.response!.statusCode!)!;
      throw CustomApiError(errorMessage);
    } catch (e) {
      throw CustomApiError('An error occurred');
    }
  }

  Future patch(
    String path, {
    Map? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response =
          await _dio.patch(path, data: data, queryParameters: queryParameters);
      return response.data as DioResponseData;
    } on DioException catch (e) {
      final errorMessage = _checkStatus(e.response!.statusCode!)!;
      throw CustomApiError(errorMessage);
    } catch (e) {
      throw CustomApiError('An error occurred');
    }
  }

  Future delete(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.delete(path, queryParameters: queryParameters);
      return response.data as DioResponseData;
    } on DioException catch (e) {
      final errorMessage = _checkStatus(e.response!.statusCode!)!;
      throw CustomApiError(errorMessage);
    } catch (e) {
      throw CustomApiError('An error occurred');
    }
  }

  Future multipartPUT(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Content-Type': 'application/octet-stream',
          },
        ),
      );

      return response.data as DioResponseData;
    } on DioException catch (e) {
      final errorMessage = _checkStatus(e.response!.statusCode!)!;
      throw CustomApiError(errorMessage);
    } catch (e) {
      throw CustomApiError('An error occurred');
    }
  }

  Future multipartPOST(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,

        options: Options(
          headers: {
            'Content-Type': 'application/octet-stream',
          },
        ),
      );

      return response.data as DioResponseData;
    } on DioException catch (e) {
      final errorMessage = _checkStatus(e.response!.statusCode!)!;
      throw CustomApiError(errorMessage);
    } catch (e) {
      throw CustomApiError('An error occurred');
    }
  }

  String? _checkStatus(int code) {
    if (code <= 400) {
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
