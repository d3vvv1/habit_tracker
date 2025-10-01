import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  set locale(Locale value) {
    if (_locale != value) {
      _locale = value;
      notifyListeners();
    }
  }
}
