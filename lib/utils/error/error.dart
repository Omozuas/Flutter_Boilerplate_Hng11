class ApiError implements Exception {
  final int? statusCode;
  final String message;

  const ApiError({ this.statusCode, required this.message});

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      statusCode: json['statusCode'],
      message: json['message'],
    );
  }

  @override
  String toString() => 'ApiError(statusCode: $statusCode, message: $message)';
}