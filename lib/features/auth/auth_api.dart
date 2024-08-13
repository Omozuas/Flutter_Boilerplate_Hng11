import 'package:dio/dio.dart';
import 'package:flutter_boilerplate_hng11/services/dio_provider.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:flutter/cupertino.dart';
import '../../models/company_user.dart';
import '../../services/response_model.dart';
import '../../utils/error/error.dart';




class AuthApi {
  //Inject the DioProvider Dependency
  DioProvider dioProvider = locator<DioProvider>();

  /// Ensure you call updateAccessToken after login and registration success.

  Future<ResponseModel?> registerSingleUser({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    String? adminSecret,
  }) async {
    try {
      final response = await dioProvider.post(
        '/auth/register',
        data: {
          'email': email,
          'first_name': firstName,
          'last_name': lastName,
          'password': password,
          'admin_secret': adminSecret ?? "123",
        },
      );
      return response;
    } catch (e) {
      debugPrint('Error during registration: ${e.toString()}');
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
        dioProvider.updateAccessToken(accessToken);
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
  dioProvider.updateAccessToken(
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImFmMjdhMjBhLWJjMjMtNDI5NS05ZWM5LTA1MDM1ZGMyZmYzZCIsInN1YiI6ImFmMjdhMjBhLWJjMjMtNDI5NS05ZWM5LTA1MDM1ZGMyZmYzZCIsImVtYWlsIjoiamF5b2tlbG9sYTM0MUBnbWFpbC5jb20iLCJpYXQiOjE3MjM1NDUxODYsImV4cCI6MTcyMzU2Njc4Nn0.2fesL140kBGWTxooNycLbqZoFNULSRWUcXUXmLynOEc');
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
