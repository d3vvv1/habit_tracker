// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

extension ThemeModeExtension on ThemeMode {
  int getThemeModeCode() {
    switch (this) {
      case ThemeMode.system:
        return 0;
      case ThemeMode.light:
        return 1;
      case ThemeMode.dark:
        return 2;
    }
  }

  static ThemeMode getThemeModeByCode(int code) {
    if (code == 0) {
      return ThemeMode.system;
    } else if (code == 1) {
      return ThemeMode.light;
    } else if (code == 2) {
      return ThemeMode.dark;
    } else {
      throw Exception('Undefined code for ThemeMode');
    }
  }
}
