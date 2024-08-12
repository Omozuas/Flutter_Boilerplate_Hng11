import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/models/company_user.dart';
import 'package:flutter_boilerplate_hng11/utils/error/error.dart';
import 'package:http/http.dart' as http;

Future<Company> registerUser(Company user) async {
  final url = Uri.parse('https://api-golang.boilerplate.hng.tech/api/v1/organisations');
  var company = Company.initial();
  try {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NfdXVpZCI6IjAxOTE0NWFhLWQ0MGUtN2I2OS05ZTAyLTNhM2JmNzZiMDBjNyIsImF1dGhvcmlzZWQiOnRydWUsImV4cCI6MTcyMzYyMzUwOSwidXNlcl9pZCI6IjAxOTE0MzQ3LTY4OTYtN2I2MC1hN2ExLTQ1ZDdiNTg3N2UyNiJ9.GZPVi0Wc08uoFC-jeLVzig6xAo1_CO3gXn_8tDioGx8'
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      // Organization created successfully
      company = Company.fromJson(response.body);
    } else if (response.statusCode == 400) {
      // Bad request
      throw ApiError(
          statusCode: response.statusCode,
          message: jsonDecode(response.body)['message']);
    } else if (response.statusCode == 401) {
      // Unauthorized
      throw ApiError(
          statusCode: response.statusCode,
          message: jsonDecode(response.body)['message']);
    } else if (response.statusCode == 404) {
      // Not found
      throw ApiError(
          statusCode: response.statusCode,
          message: jsonDecode(response.body)['message']);
    } else if (response.statusCode == 500) {
      // Server error
      throw ApiError(
          statusCode: response.statusCode,
          message: jsonDecode(response.body)['message']);
    } else {
      // Handle other status codes
    }
  } catch (e) {
    // Handle any exceptions that might occur during the request
    debugPrint('Registration failed: ${e.toString()}');
  }
  return company;
}
