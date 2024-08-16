import 'package:flutter_riverpod/flutter_riverpod.dart';

extension NoneErrorValue<T> on AsyncValue<T?> {
  T? get sureValue {
    try {
      return value;
    } catch (e) {
      return null;
    }
  }
}
