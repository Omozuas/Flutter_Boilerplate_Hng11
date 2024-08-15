import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate_hng11/services/dio_provider.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_hng11/utils/initializations.dart';
import '../../models/company_user.dart';
import '../../services/response_model.dart';
import '../../utils/error/error.dart';

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

  // google sign in
  Future<ResponseModel> googleSignIn(String idToken) async {
    try {
      ResponseModel response = await dioProvider.post(
        // 'https://staging.api-nestjs.boilerplate.hng.tech/api/v1/
        '/auth/google?mobile=true',
        data: {
          'id_token': idToken,
        },
      );
      log(response.message!);

      if (response.message == 'Authentication successful') {
        // Update the access token if needed
        // dioProvider.updateAccessToken(response.accessToken ?? '');
      }
      box.write("accessToken", response.accessToken);
      return response;
    } catch (e) {
      debugPrint('Error during Google sign-in: $e');
      rethrow; // Optional: Re-throw the error to handle it further up the call stack
    }
  }
}

//Keep in mind that an organisation/company is generated for every user upon successful sign up.
Future<Company> registerCompany(Company company) async {
  DioProvider dioProvider = locator<DioProvider>();
  // An authenticated user is required for this request to be completed based on the api.
  // tODO: Remove access token in place of currently signed user's token.
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
