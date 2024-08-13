import 'package:dio/dio.dart';

import 'package:flutter_boilerplate_hng11/models/company_user.dart';
import 'package:flutter_boilerplate_hng11/utils/error/error.dart';

//Keep in mind that an organisation/company is generated for every user upon successful sign up.
Future<Company> registerCompany(Company company) async {
  final dio = Dio();
  var registeredCompany = Company.initial();
  try {
    var response = await dio.post(
      'https://staging.api-nestjs.boilerplate.hng.tech/api/v1/organisations',
      data: company.toMap(),
      options: Options(headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        // An authenticated user is required for this request to be completed based on the api.
        // TODO: Remove access token in place of currently signed user's token.
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImFmMjdhMjBhLWJjMjMtNDI5NS05ZWM5LTA1MDM1ZGMyZmYzZCIsInN1YiI6ImFmMjdhMjBhLWJjMjMtNDI5NS05ZWM5LTA1MDM1ZGMyZmYzZCIsImVtYWlsIjoiamF5b2tlbG9sYTM0MUBnbWFpbC5jb20iLCJpYXQiOjE3MjM1NDUxODYsImV4cCI6MTcyMzU2Njc4Nn0.2fesL140kBGWTxooNycLbqZoFNULSRWUcXUXmLynOEc'
      }),
    );
    registeredCompany = Company.fromMap(response.data['data']);
  } on DioException catch (e) {
    throw ApiError(message: e.message!);
  }

  return registeredCompany;
}
