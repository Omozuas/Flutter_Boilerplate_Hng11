import 'dart:ui';

class LocalizationClass{


  static Locale english =  const Locale('en');
  static Locale chinese = const  Locale('zh');
  static Locale spanish = const Locale('es');

  static List<Locale> locales = [
    english,chinese,spanish,
  ];

  static Locale getLocale(String languageCode) {
    switch (languageCode) {
      case 'es':
        return spanish;
      case 'zh':
        return chinese;
      case 'en':
      default:
        return english;
    }
  }

}