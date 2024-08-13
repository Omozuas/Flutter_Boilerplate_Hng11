import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/models/company_user.dart';
import 'package:flutter_boilerplate_hng11/utils/error/error.dart';

Future<void> registerCompany(Company company) async {
  final dio = Dio();
  //This is a workaround for the certicate error I keep getting.
  // (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
  //     (HttpClient client) {
  //   client.badCertificateCallback =
  //       (X509Certificate cert, String host, int port) => true;
  //   return client;
  // };
  try {
    const baseUrl = 'https://staging.api-nestjs.boilerplate.hng.tech/api/v1/';
    var response = await dio.postUri(
      Uri.parse('$baseUrl/organisations'),
      data: company.toMap(),
      options: Options(headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        // An authenticated user is required for this request to be completed based on the api.
        // TODO: Remove access token in place of currently signed user's token.
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImFiOTQ4YmNmLWIzNGQtNDE4OC1iNjlkLTUxZmNmNjkyZTU5ZCIsInN1YiI6ImFiOTQ4YmNmLWIzNGQtNDE4OC1iNjlkLTUxZmNmNjkyZTU5ZCIsImVtYWlsIjoiamF5b2tlbG9sYTM0MUBleGFtcGxlLmNvbSIsImlhdCI6MTcyMzQ4ODc3OSwiZXhwIjoxNzIzNTEwMzc5fQ.b6xgdeL_-1jl2yCJTeY3mPRL2Rv_jeMmmCTDQz7kkm8'
      }),
    );
    // debugPrint(response.data.toString());
    // debugPrint(Company.fromMap(response.data).toString());
  } on DioException catch (e) {
    throw ApiError(message: e.message!);
  }

  //return Company.fromMap(response.data);
}
