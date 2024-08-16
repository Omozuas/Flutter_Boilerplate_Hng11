import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/login_screen.dart';
import 'package:flutter_boilerplate_hng11/services/error_handlers.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:one_context/one_context.dart';

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

    if (box.read('accessToken') != null) {
      options.headers["Authorization"] = "Bearer ${box.read('accessToken')}";
    }
    else{
      if(options.path == 'auth/login'){}
      else{
        Navigator.push(OneContext().context!, MaterialPageRoute(builder:
            (context)=>const LoginScreen()
        ));
      }

      //when token is expired has been handled in the error handle as when status code is 401.

    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // log('Response >> ${response}');

    super.onResponse(response, handler);
  }
}
