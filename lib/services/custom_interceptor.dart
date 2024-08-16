import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/login_screen.dart';
import 'package:flutter_boilerplate_hng11/services/error_handlers.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:one_context/one_context.dart';

import 'user.service.dart';

class CustomInterceptor extends Interceptor {
  GetStorage box = locator<GetStorage>();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    ErrorHandlers.allErrorHandler(err);
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    UserService user = locator<UserService>();
    String? userToken = user.userAccessToken;
    // log('Endpoint >> ${options.path}');
    // log('Request body >> ${options.data}');
    // if (userToken != null) {
    //   options.headers["Authorization"] = "Bearer $userToken";
    // }
    log('Endpoint >> ${options.path}');
    log('Request body >> ${options.data}');

    if (userToken != null) {
      options.headers["Authorization"] = "Bearer $userToken";
    } else if (options.path == 'auth/login' ||
        options.path == '/auth/google?mobile=true' ||
        options.path == '/auth/register') {
    } else {
      OneContext()
          .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.cancel,
          error: 'Access cannot be used',
        ),
      );
    }
    super.onRequest(options, handler);
  }
}
