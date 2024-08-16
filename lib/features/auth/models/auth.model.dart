class ApiResponse {
  final bool? success;
  final String? message;
  final dynamic data;

  ApiResponse({this.success, this.message, this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'],
    );
  }
}
