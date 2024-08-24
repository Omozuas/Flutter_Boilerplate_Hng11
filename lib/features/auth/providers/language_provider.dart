import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:get_storage/get_storage.dart';

import '../../../localiza/localiza_class.dart';

class LanguageNotifier extends StateNotifier<Locale> {
  static const _languageKey = 'language_code';
  final GetStorage _storage = GetStorage();

  LanguageNotifier() : super(_loadSavedLocale());

  static Locale _loadSavedLocale() {
    final storage = GetStorage();
    final savedLanguageCode = storage.read<String>(_languageKey) ??
        LocalizationClass.english.languageCode;
    return LocalizationClass.getLocale(savedLanguageCode);
  }

  void setLanguage(String languageCode) {
    state = LocalizationClass.getLocale(languageCode);
    _storage.write(_languageKey, languageCode);
  }
}

final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>(
    (ref) => LanguageNotifier());
