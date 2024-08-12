import 'dart:developer';

import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('Endpoint >> ${err.response!.requestOptions.path}');
    log('Code >> ${err.response!.statusCode}');
    log('Error >> ${err.response!.data}');

    super.onError(err, handler);
  }
}
