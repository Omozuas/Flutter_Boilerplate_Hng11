import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate_hng11/services/dio_provider.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_hng11/utils/initializations.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../models/company_user.dart';
import '../../services/response_model.dart';
import '../../utils/error/error.dart';
import '../../utils/initializations.dart';

class AuthApi {
  //Inject the DioProvider Dependency
  DioProvider dioProvider = locator<DioProvider>();

  /// Ensure you call updateAccessToken after login and registration success.

  Future registerSingleUser({
    required Map<String, dynamic> data,
    String? adminSecret,
  }) async {
    data['admin_secret'] = adminSecret ?? 123;
    try {
      final response = await dioProvider.post('/auth/register', data: data);
      return response;
    } catch (e) {
      //ErrorHandlers.allErrorHandler(e);
      return null;
    }
  }

  // forgot password api
  Future<ResponseModel?> forgotPassword({
    required String email,
  }) async {
    try {
      final response = await dioProvider.post(
        '/auth/forgot-password',
        data: {
          'email': email,
        },
      );
      return response;
    } catch (e) {
      debugPrint('Error: ${e.toString()}');
      return null;
    }
  }

  // reset password api
  Future<ResponseModel?> resetPassword({
    required String email,
    required String otp,
    required String newpassword,
  }) async {
    try {
      final response = await dioProvider.patchUpdate(
        "/auth/password-reset",
        data: {
          'email': email,
          'token': otp,
          'new_Password': newpassword,
        },
      );
      return response;
    } catch (e) {
      debugPrint('Error In Resetting password: ${e.toString()}');
      return null;
    }
  }

  Future<ResponseModel?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioProvider.post('auth/login', data: {
        'email': email,
        'password': password,
      });
      if (response != null && response.data != null) {
        String accessToken = response.data['access_token'];
        box.write('accessToken', accessToken);
        //  dioProvider.updateAccessToken(accessToken);
      }
      return response;
    } catch (e) {
      debugPrint('Error during login: ${e.toString()}');
      return null;
    }
  }
}

//Keep in mind that an organisation/company is generated for every user upon successful sign up.
Future<Company> registerCompany(Company company) async {
  DioProvider dioProvider = locator<DioProvider>();
  // An authenticated user is required for this request to be completed based on the api.
  // TODO: Remove access token in place of currently signed user's token.
  // box.write('accessToken','accessToken');

  var registeredCompany = Company.initial();
  try {
    var response = await dioProvider.post(
      'https://staging.api-nestjs.boilerplate.hng.tech/api/v1/organisations',
      data: company.toMap(),
    );
    registeredCompany = Company.fromMap(response.data['data']);
  } on DioException catch (e) {
    throw ApiError(message: e.message!);
  }

  return registeredCompany;
}
