extension StringEx on String {
  bool get isValidBase64 {
    final base64Pattern = RegExp(r'^[A-Za-z0-9+/=]+$');
    final isMatch = base64Pattern.hasMatch(this);
    return isMatch && length % 4 == 0;
  }

  String get capitalize {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
