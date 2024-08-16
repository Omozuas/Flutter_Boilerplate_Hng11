import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/services/error_handlers.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

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

      final isTokenExpired = JwtDecoder.isExpired(box.read('accessToken'));
      if(isTokenExpired){
        handler.reject(
          DioException(
            requestOptions: options,
            type: DioExceptionType.cancel,
            error: 'Access  Token Expired',
          ),
        );
        AppRouter.router.go(AppRoute.login);
      }
      else {
        options.headers["Authorization"] = "Bearer ${box.read('accessToken')}";
      }

    }
    else if (options.path == 'auth/login'
        || options.path == '/auth/google?mobile=true'
        || options.path == '/auth/register'
    ){

    }
    else{

      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.cancel,
          error: 'Access cannot be used',
        ),
      );
      AppRouter.router.go(AppRoute.login);
    }
    super.onRequest(options, handler);
  }

}
