import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:habit_tracker/core/localizations/app_localizations.dart';

class AppWords {
  static Locale locale = const Locale('en');

  static const supportedLocales = [Locale('en'), Locale('ru')];

  static const localizationDelegates = <LocalizationsDelegate>[
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    AppLocalizations.delegate,
  ];

  static AppLocalizations of(BuildContext context) =>
      AppLocalizations.of(context)!;
}
