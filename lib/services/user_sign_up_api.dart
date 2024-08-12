// File: user_sign_up_api.dart
// Author: Otonye-dev
// Created: 2024-08-12
//
// This file contains the UserSignUpApi class, which handles user registration.
// It includes a method for signing up a new user with their details.

import 'dart:convert';
import 'package:http/http.dart' as http;

class UserSignUpApi {
  final String baseUrl = "https://api-golang.boilerplate.hng.tech/api/v1";

  Future<Map<String, dynamic>> registerUser({
    required String username,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    final url = Uri.parse('$baseUrl/auth/register');
    final body = jsonEncode({
      'username': username,
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
    });

    final response = await http.post(url, body: body);
    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    final statusCode = response.statusCode;
    final responseBody = jsonDecode(response.body);

    if (statusCode == 201) {
      return {
        'status': responseBody['status'],
        'message': responseBody['message'],
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
      throw Exception('Unexpected error occurred');
    }
  }
}
