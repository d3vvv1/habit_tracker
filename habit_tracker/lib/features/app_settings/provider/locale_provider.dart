import 'package:flutter/material.dart';
import 'package:habit_tracker/features/app_settings/domain/app_settings_irepository.dart';

class LocaleProvider with ChangeNotifier {
  final IAppSettingsRepository _appSettingsRepository;

  Locale _locale = const Locale('en');

  LocaleProvider({required IAppSettingsRepository appSettingsRepository})
      : _appSettingsRepository = appSettingsRepository;

  void init() {
    _locale = Locale(_appSettingsRepository.getAppLocaleCode());
  }

  Locale get locale => _locale;

  set locale(Locale value) {
    if (_locale != value) {
      _locale = value;
      notifyListeners();
    }
    _appSettingsRepository.saveLocaleCodeChange(_locale.languageCode);
  }
}
