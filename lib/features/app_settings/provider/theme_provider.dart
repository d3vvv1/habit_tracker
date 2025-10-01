import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
