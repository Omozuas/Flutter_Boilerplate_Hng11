import '../features/auth/models/user_model.dart';

class ResponseModel {
  final int statusCode;
  final String status;
  final String? message;
  final String? accessToken;
  final User? user;

  ResponseModel({
    required this.statusCode,
    required this.status,
    this.message,
    this.accessToken,
    this.user,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    final int statusCode = json['status_code'] ?? 0;

    if (statusCode == 200 || statusCode == 201) {
      if (json.containsKey('access_token')) {
        // Login response
        return ResponseModel(
          statusCode: statusCode,
          status: 'success',
          message: json['message'],
          accessToken: json['access_token'],
          user: User.fromJson(json['data']['user']),
        );
      } else if (json.containsKey('data') && json['data'].containsKey('user')) {
        // Registration response
        return ResponseModel(
          statusCode: statusCode,
          status: 'success',
          message: json['message'],
          user: User.fromJson(json['data']['user']),
        );
      } else {
        // Unexpected success format
        return ResponseModel(
          statusCode: statusCode,
          status: 'success',
          message: 'Unexpected response format',
        );
      }
    } else if (statusCode == 400 || statusCode == 401) {
      // Error response
      return ResponseModel(
        statusCode: statusCode,
        status: 'error',
        message: json['message'],
      );
    } else {
      // Unexpected status code
      return ResponseModel(
        statusCode: statusCode,
        status: 'error',
        message: 'Unexpected error occurred',
      );
    }
  }
}