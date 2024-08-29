import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/services/error_handlers.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_snackbar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'user.service.dart';

class CustomInterceptor extends Interceptor {
  GetStorage box = locator<GetStorage>();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // super.onError(err, handler);
    ErrorHandlers.allErrorHandler(err);
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    UserService user = locator<UserService>();
    String? userToken = user.userAccessToken;

    log('Endpoint >> ${options.path}');
    log('Request body >> ${options.data}');
    if (userToken != null) {
      final isTokenExpired = JwtDecoder.isExpired(userToken);
      if (isTokenExpired) {
        showSnackBar('Token Expired, kindly login again');
        handler.reject(
          DioException(
            requestOptions: options,
            type: DioExceptionType.cancel,
            error: 'Access  Token Expired',
          ),
        );
        AppRouter.router.go(AppRoute.login);
      } else {
        options.headers["Authorization"] = "Bearer ${box.read('accessToken')}";
      }
    } else if (options.path.startsWith('auth/') ||
        options.path.startsWith('/auth/')) {
      // Do nothing (continue login, rest password or sign in a
      // s the endpoint is unprotected
    } else {
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.cancel,
          error: 'Access token seems empty',
        ),
      );
      AppRouter.router.go(AppRoute.login);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('Response >> $response');
    super.onResponse(response, handler);
  }
}
