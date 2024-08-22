import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../localiza/localiza_class.dart';

class LanguageNotifier extends StateNotifier<Locale> {
  LanguageNotifier() : super(LocalizationClass.english);

  void setLanguage(String languageCode) {
    state = LocalizationClass.getLocale(languageCode);
  }
}

final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>(
    (ref) => LanguageNotifier());
