import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('uk', 'UA');

  Locale get currentLocale => _currentLocale;

  void updateLocale(Locale newLocale) {
    _currentLocale = newLocale;
    notifyListeners();
  }
}
