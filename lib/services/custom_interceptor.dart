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
    else if (options.path == 'auth/login'
        || options.path == '/auth/google?mobile=true'
        || options.path == '/auth/register'
    ){

    }
    else{
<<<<<<< HEAD
<<<<<<< HEAD
      //todo: handle when access token is null
      //todo: handle when access token is expired
=======
      if(options.path == 'auth/login'){}
      else{
        Navigator.push(OneContext().context!, MaterialPageRoute(builder:
            (context)=>const LoginScreen()
        ));
      }

      //when token is expired has been handled in the error handle as when status code is 401.

>>>>>>> e5306ef06daacf3f884bcd17690968add267b982
=======
      OneContext().push(MaterialPageRoute(builder: (context)=>const LoginScreen()));
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.cancel,
          error: 'Access cannot be used',
        ),
      );
>>>>>>> 1968a69cbc0280e5fa85c6c55a94dce2ac97fdf3
    }
    super.onRequest(options, handler);
  }

}
