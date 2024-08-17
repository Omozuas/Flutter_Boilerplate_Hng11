extension StringEx on String {
  bool get isValidBase64 {
    print('Checking Base64 validity for string of length $length');
    final base64Pattern = RegExp(r'^[A-Za-z0-9+/=]+$');
    final isMatch = base64Pattern.hasMatch(this);
    print('Pattern match result: $isMatch, Length mod 4: ${length % 4}');
    return isMatch && length % 4 == 0;
  }

  String get capitalize {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
