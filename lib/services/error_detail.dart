class ErrorDetail {
  final String field;

  ErrorDetail({required this.field});

  factory ErrorDetail.fromJson(Map<String, dynamic> json) {
    return ErrorDetail(
      field: json['field'],
    );
  }
}