class ResponseModel {
  final int statusCode;
  final Object status;
  final String? message;
  final dynamic data;

  //final String? accessToken;
  // final User? user;

  ResponseModel({
    required this.statusCode,
    required this.status,
    this.message,
    this.data,
    // this.accessToken,
    // this.user,
  });

  @override
  String toString() {
    return 'ResponseModel(statusCode: $statusCode, status: $status, data: $data, message: $message)';
  }

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      statusCode: json['status_code'] ?? 0,
      status: json['status'] ?? '',
      data: json,
      message: json['message'],
    );
    //final int statusCode = json['status_code'] ?? 0;

    // if (statusCode == 200 || statusCode == 201) {
    //   if (json.containsKey('access_token')) {
    //     // Login response
    //     return ResponseModel(
    //       statusCode: statusCode,
    //       status: 'success',
    //       message: json['message'],
    //       accessToken: json['access_token'],
    //       user: User.fromJson(json['data']['user']),
    //     );
    //   } else if (json.containsKey('data') && json['data'].containsKey('user')) {
    //     // Registration response
    //     return ResponseModel(
    //       statusCode: statusCode,
    //       status: 'success',
    //       message: json['message'],
    //       user: User.fromJson(json['data']['user']),
    //     );
    //   } else {
    //     // Unexpected success format
    //     return ResponseModel(
    //       statusCode: statusCode,
    //       status: 'success',
    //       message: 'Unexpected response format',
    //     );
    //   }
    // }
    // else if (statusCode == 400 || statusCode == 401) {
    //   // Error response
    //   return ResponseModel(
    //     statusCode: statusCode,
    //     status: 'error',
    //     message: json['message'],
    //   );
    // } else {
    //   // Unexpected status code
    //   return ResponseModel(
    //     statusCode: statusCode,
    //     status: 'error',
    //     message: 'Unexpected error occurred',
    //   );
    // }
  }
}
