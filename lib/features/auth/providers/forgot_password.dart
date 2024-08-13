import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ResetPasswordApi {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: DotEnv().env['BASE_URL']!,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

// forgot password api
  Future forgotPassord(
    String email,
  ) async {
    try {
      final String path = '${DotEnv().env['FORGOT_PASSWORD_ENDPOINT']}';
      await _dio.post(
        path,
        data: {
          'email': email,
        },
      );
      return;
    } catch (e) {
      rethrow;
    }
  }

// reset password api
  Future resetPassword(String email, String otp, String newpassword) async {
    try {
      final String path = '${DotEnv().env['PASSWORD_RESET_ENDPOINT']}';
      final Map<String, dynamic> data = {
        'email': email,
        'otp': otp,
        'new_password': newpassword
      };
      await _dio.patch(path, data: data);

      return;
    } catch (e) {
      debugPrint("ERROR ${e.toString()}");
    }
  }
}
