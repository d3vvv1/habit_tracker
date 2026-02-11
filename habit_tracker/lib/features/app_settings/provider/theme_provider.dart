import 'package:flutter/material.dart';
import 'package:habit_tracker/features/app_settings/domain/app_settings_irepository.dart';

class ThemeProvider with ChangeNotifier {
  final IAppSettingsRepository _appSettingsRepository;
  ThemeMode _themeMode = ThemeMode.system;

  ThemeProvider({required IAppSettingsRepository appSettingsRepository})
      : _appSettingsRepository = appSettingsRepository;

  void init() {
    _themeMode = _appSettingsRepository.getThemeMode();
  }

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(ThemeMode themeMode) {
    _themeMode = themeMode;
    _appSettingsRepository.saveThemeChange(_themeMode);
    notifyListeners();
  }
}
