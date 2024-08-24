class CustomApiError implements Exception {
  final String message;
  CustomApiError(this.message);

  @override
  String toString() {
    return 'CustomAPIError(message: $message)';
  }
}
