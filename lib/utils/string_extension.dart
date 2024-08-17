extension StringEx on String {
  bool get isValidBase64 {
    final base64Pattern =
        RegExp(r'^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?$');
    return base64Pattern.hasMatch(this) && length % 4 == 0;
  }
}
