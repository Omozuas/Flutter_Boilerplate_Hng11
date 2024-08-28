import 'dart:convert';
import 'dart:developer';

import 'package:flutter_boilerplate_hng11/services/dio_provider.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import '../../common_models/get_user_response.dart';
import '../../models/company_user.dart';
import '../../services/response_model.dart';

class AuthApi {
  DioProvider dioProvider = locator<DioProvider>();
  GetStorage box = locator<GetStorage>();

  /// Ensure you call updateAccessToken after login and registration success.

  Future<ResponseModel?> registerSingleUser({
    required Map<String, dynamic> data,
    String? adminSecret,
  }) async {
    data['admin_secret'] = adminSecret ?? '123';
    return await dioProvider.post('/auth/register', data: data);
  }

  // forgot password api
  Future<ResponseModel?> forgotPassword({
    required String email,
  }) async {
    try {
      final response = await dioProvider.post(
        '/auth/$email/forgot-password-mobile',
      );
      return response;
    } catch (e) {
      debugPrint('Errors In Resetting password: ${e.toString()}');
      return null;
    }
  }

  Future<ResponseModel?> verifyCode({
    required String email,
    required String code,
  }) async {
    try {
      final response = await dioProvider.post(
        '/auth/$email/$code/verify-code',
      );
      return response;
    } catch (e) {
      debugPrint('Error In verrifying code: $e');
      return null;
    }
    // return await dioProvider.post(
    //   '/auth/$email/forgot-password',
    //   data: {
    //     'email': email,
    //   },
    // );
  }

  // reset password api
  Future<ResponseModel?> resetPassword({
    required String email,
    required String confirmNewPassword,
    required String newPassword,
  }) async {
    try {
      final response = await dioProvider.putUpdate(
        "/auth/reset-password-mobile",
        data: {
          "new_password": newPassword,
          "confirm_new_password": confirmNewPassword,
          "email": email
        },
      );
      return response;
    } catch (e) {
      debugPrint('Error In Resetting password: ${e.toString()}');
      return null;
    }
  }

  Future<ResponseModel?> loginUser(Map data) async {
    try {
      final response = await dioProvider.post('auth/login', data: data);
      if (response != null && response.data != null) {
        String accessToken = response.data['access_token'];
        box.write('accessToken', accessToken);
      }
      log('${response?.data}');
      return response;
    } catch (e) {
      debugPrint('Error during login: ${e.toString()}');
      return null;
    }
  }

  Future<GetUserData?> getUser() async {
    try {
      final response = await dioProvider.get(
        'auth/@me',
      );
      debugPrint(response?.data.toString());
      return GetUserData.fromJson(jsonDecode(jsonEncode(response?.data)));
    } catch (e) {
      debugPrint('Error during login: ${e.toString()}');
      return null;
    }
  }

  Future<ResponseModel?> googleSignIn(String idToken) async {
    try {
      ResponseModel? response = await dioProvider.post(
        '/auth/google?mobile=true',
        data: {
          'id_token': idToken,
        },
      );
      log(response?.message ?? ' No response');
      return response;
    } catch (e) {
      return null;
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
        'organisations',
        data: company.toMap(),
      );
      registeredCompany = Company.fromMap(response?.data);
    } catch (e) {
      rethrow;
    }

    return registeredCompany;
  }
}
