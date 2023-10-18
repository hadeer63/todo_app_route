import 'package:flutter/material.dart';

import '../shared/styles/colors.dart';

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

  //  getBackground() {
  //   if (modeApp == ThemeMode.light) {
  //     return Scaffold(
  //       backgroundColor: mint
  //     );
  //   } else {
  //     return Scaffold(
  //         backgroundColor: Color(0xFF141A2E)
  //     );
  //   }
  // }
}
