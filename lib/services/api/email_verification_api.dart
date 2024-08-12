// File: email_verification_api.dart
// Author: Otonye-dev
// Created: 2024-08-12
//
// This file contains the EmailVerificationApi class, which handles operations related to
// email verification. It includes methods for requesting a verification token and
// verifying the email using a token.

import 'dart:convert';
import 'package:http/http.dart' as http;

/// Handles email verification operations.
class EmailVerificationApi {
  final String baseUrl = "https://api-golang.boilerplate.hng.tech/api/v1";

  /// Requests a verification token for the provided email address.
  Future<Map<String, dynamic>> requestVerificationToken({
    required String email,
  }) async {
    final url = Uri.parse('$baseUrl/auth/email-request');
    final body = jsonEncode({'email': email});

    final response = await http.post(url, body: body);
    return _handleResponse(response);
  }

  /// Verifies the email using the provided verification token.
  Future<Map<String, dynamic>> verifyEmail({
    required String verificationToken,
  }) async {
    final url = Uri.parse('$baseUrl/auth/email-request/verify');
    final body = jsonEncode({'token': verificationToken});

    final response = await http.post(url, body: body);
    return _handleResponse(response);
  }

  /// Processes the HTTP response and returns a structured map.
  Map<String, dynamic> _handleResponse(http.Response response) {
    final statusCode = response.statusCode;
    final responseBody = jsonDecode(response.body);

    if (statusCode == 200) {
      return {
        'status': responseBody['status'],
        'message': responseBody['message'],
      };
    } else if (statusCode == 401 || statusCode == 404) {
      return {
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
      throw Exception('Unexpected error occurred: ${responseBody['message']}');
    }
  }
}
