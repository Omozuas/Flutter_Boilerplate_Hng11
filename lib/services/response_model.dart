// File: auth_response.dart
// Author: Otonye-dev
// Created: 2024-08-12
//
// This file contains the unified class representing the auth response from the API.

import 'error_detail.dart';

class ResponseModel {
  final String status;
  final int? statusCode;
  final String? message;
  final List<ErrorDetail>? errors;
  final String? accessToken; // Only used in the login success case

  ResponseModel({
    required this.status,
    this.statusCode,
    this.message,
    this.errors,
    this.accessToken,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['status_code'] == 200) {
      return ResponseModel(
        status: json['status'],
        message: json['message'],
        statusCode: json['status_code'],
        accessToken: json['data']['access_token'] != null
            ? json['data']['access_token']
            : null,
      );
    } else if (json['status_code'] == 422) {
      return ResponseModel(
        status: json['status'],
        message: json['message'],
        statusCode: json['status_code'],
        errors: (json['errors'] as List<dynamic>?)
            ?.map((e) => ErrorDetail.fromJson(e))
            .toList(),
      );
    } else {
      // Unexpected error
      throw Exception('Unexpected error occurred');
    }
  }
}
