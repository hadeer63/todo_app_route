import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = 'en';
  bool isEnglish = true;
  ThemeMode modeApp = ThemeMode.light;

  void changeLanguage(String langCode) {
    languageCode = langCode;
    notifyListeners();
  }

  changeTheme(ThemeMode mode) {
    modeApp = mode;
    notifyListeners();
  }

  String getBackground() {
    if (modeApp == ThemeMode.light) {
      return "assets/images/background.png";
    } else {
      return "assets/images/background_dark.png";
    }
  }
}
