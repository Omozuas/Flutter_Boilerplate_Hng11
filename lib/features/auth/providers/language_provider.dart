import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../localiza/localiza_class.dart';
import '../../../services/service_locator.dart';

class LanguageNotifier extends StateNotifier<Locale> {
  LanguageNotifier() : super(_loadInitialLanguage());

  static final GetStorage _box = locator<GetStorage>();

  static Locale _loadInitialLanguage() {
    final savedLanguageCode = _box.read<String>('selectedLanguage');
    return LocalizationClass.getLocale(savedLanguageCode ?? 'en');
  }

  void setLanguage(String languageCode) {
    state = LocalizationClass.getLocale(languageCode);
    _box.write('selectedLanguage', languageCode);
  }
}

final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>(
    (ref) => LanguageNotifier());
