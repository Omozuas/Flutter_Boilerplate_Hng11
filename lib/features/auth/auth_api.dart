import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate_hng11/services/dio_provider.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_hng11/services/user.service.dart';
import 'package:get_storage/get_storage.dart';
import '../../common_models/get_user_response.dart';
import '../../models/company_user.dart';
import '../../services/response_model.dart';

class AuthApi {
  DioProvider dioProvider = locator<DioProvider>();
  GetStorage box = locator<GetStorage>();
  UserService _userService = locator<UserService>();

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
    return await dioProvider.post(
      '/auth/forgot-password',
      data: {
        'email': email,
      },
    );
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

  Future<ResponseModel?> loginUser(Map data) async {
    try {
      final response = await dioProvider.post('auth/login', data: data);
      if (response != null && response.data != null) {
        String accessToken = response.data['access_token'];
        box.write('accessToken', accessToken);
      }
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
      print(response?.data);
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
