import 'dart:ui';

class LocalizationClass {
  static Locale english = const Locale('en');
  static Locale chinese = const Locale('zh');
  static Locale spanish = const Locale('es');
  static Locale french = const Locale('fr');

  static List<Locale> locales = [
    english,
    chinese,
    spanish,
    french,
  ];

  static Locale getLocale(String languageCode) {
    switch (languageCode) {
      case 'en':
      return english;
      case 'es':
        return spanish;
      case 'zh':
        return chinese;
      case 'fr':
      default:
        return french;
    }
  }
}
