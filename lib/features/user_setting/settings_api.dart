import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_hng11/services/response_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'models/status_model.dart';

class DioProvider {
  final Dio _dio;
  String? _accessToken;

  DioProvider()
      : _dio = Dio(BaseOptions(
          baseUrl: dotenv.env['BASE_URL']!,
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
      return RequestUserInfo.fromJson(response.data);
    } catch (e) {
      debugPrint("ERROR ${e.toString()}");
    }
  }

  Future getUserById(String path, {Map<String, dynamic>? query}) async {
    try {
      var response = await _dio.get(path, queryParameters: query);
      return RequestUserInfo.fromJson(response.data);
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
