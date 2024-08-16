import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/screen/login_screen.dart';
import 'package:one_context/one_context.dart';

import '../utils/widgets/custom_snackbar.dart';

class ErrorHandlers {
  static void allErrorHandler(error) {
    if (error is TypeError) {
      log('Check your code for type error : ${error.stackTrace}');
      return;
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        showSnackBar('Connection timed out');
        break;

      case DioExceptionType.connectionError:
        showSnackBar('Connection error');
        break;

      case DioExceptionType.cancel:
        log('Request cancelled');
        break;

      case DioExceptionType.badResponse:
        _serverErrorHandler(error.response!);
        break;

      case DioExceptionType.badCertificate:
        log('Bad certificate');
        break;

      case DioExceptionType.unknown:
        if (error.message!.contains('SocketException')) {
          showSnackBar('Check your internet connection');
          break;
        } else {
          showSnackBar('Something went wrong');
          break;
        }

      default:
        _serverErrorHandler(error.response!);
    }
  }

  static void _serverErrorHandler(Response response) {
    log(response.toString());
    showSnackBar(response.data['message'] ?? response.toString());
    switch (response.statusCode) {
      //case 400:
      case 401:
        Navigator.of(OneContext().context!).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
              (Route<dynamic> route) => false,
        );

      // case 403:
      // case 404:
      case 500:
      default:
    }
  }
}
