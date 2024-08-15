import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_boilerplate_hng11/services/error_handlers.dart';
import 'package:flutter_boilerplate_hng11/utils/initializations.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    ErrorHandlers.allErrorHandler(err);
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('Endpoint >> ${options.path}');
    log('Request body >> ${options.data}');
    if (box.read('accessToken') != null) {
      options.headers["Authorization"] = "Bearer ${box.read('accessToken')}";
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    ///We can implement this later
    super.onResponse(response, handler);
  }
}
