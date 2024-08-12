// File: user_sign_in_api.dart
// Author: Otonye-dev
// Created: 2024-08-12
//
// This file contains the UserSignInApi class, which handles the sign-in operation.
// It includes a method for signing in a user with their credentials.

import 'dart:convert';
import 'package:http/http.dart' as http;

class UserSignInApi {
  final String baseUrl = "https://api-golang.boilerplate.hng.tech/api/v1";

  Future<Map<String, dynamic>> signInUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/auth/login');
    final body = jsonEncode({
      'email': email,
      'password': password,
    });

    final response = await http.post(url, body: body);
    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    final statusCode = response.statusCode;
    final responseBody = jsonDecode(response.body);

    if (statusCode == 200) {
      return {
        'status': responseBody['status'],
        'status_code': responseBody['status_code'],
        'message': responseBody['message'],
        'data': {
          'user': responseBody['data']['user'],
          'access_token': responseBody['data']['access_token'],
        },
      };
    } else if (statusCode == 400) {
      return {
        'status': responseBody['status'],
        'message': responseBody['message'],
      };
    } else if (statusCode == 422) {
      return {
        'status': responseBody['status'],
        'message': responseBody['message'],
        'errors': responseBody['errors'],
      };
    } else {
      throw Exception('Unexpected error occurred: ${responseBody['message']}');
    }
  }
}
