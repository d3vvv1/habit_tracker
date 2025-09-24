import 'package:flutter/material.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/theme/app_dark_theme.dart';
import 'package:habit_tracker/core/theme/app_light_theme.dart';
import 'package:habit_tracker/core/theme/colors/app_theme_colors.dart';
import 'package:habit_tracker/core/theme/text_themes/app_theme_text_styles.dart';
import 'package:habit_tracker/features/auth/presentation/auth_screen.dart';

extension BuildContextExtension on BuildContext {
  AppThemeTextStyles get appText =>
      Theme.of(this).extension<AppThemeTextStyles>()!;
  AppThemeColors get appColors => Theme.of(this).extension<AppThemeColors>()!;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: createDarkTheme(),
      theme: createLightTheme(),
      localizationsDelegates: AppWords.localizationDelegates,
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('en', 'US'),
      ],
      locale: AppWords.locale,
      home: AuthScreen(),
    );
  }
}
