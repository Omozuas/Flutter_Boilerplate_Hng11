import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_boilerplate_hng11/services/error_handlers.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:get_storage/get_storage.dart';

class CustomInterceptor extends Interceptor {
  GetStorage box = locator<GetStorage>();
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    ErrorHandlers.allErrorHandler(err);
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('Endpoint >> ${options.path}');
    log('Request body >> ${options.data}');
    log('url: ${options.uri}');
    if (box.read('accessToken') != null) {
      options.headers["Authorization"] = "Bearer ${box.read('accessToken')}";
    } else {
      //todo: handle when access token is null
      //todo: handle when access token is expired
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // log('Response >> ${response}');

    super.onResponse(response, handler);
  }
}
