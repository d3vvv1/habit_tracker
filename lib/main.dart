import 'package:flutter/material.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/routing/go_router.dart';
import 'package:habit_tracker/core/theme/app_dark_theme.dart';
import 'package:habit_tracker/core/theme/app_light_theme.dart';
import 'package:habit_tracker/core/theme/colors/app_theme_colors.dart';
import 'package:habit_tracker/core/theme/text_themes/app_theme_text_styles.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';

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
    //TODO: Спрятать в мэйне
    Adaptive.height = MediaQuery.sizeOf(context).height -
        MediaQuery.viewPaddingOf(context).top -
        MediaQuery.viewPaddingOf(context).bottom;
    Adaptive.width = MediaQuery.sizeOf(context).width;
    Adaptive.viewPaddingTop = MediaQuery.viewPaddingOf(context).top;
    return MaterialApp.router(
      themeMode: ThemeMode.light,
      darkTheme: createDarkTheme(),
      theme: createLightTheme(),
      localizationsDelegates: AppWords.localizationDelegates,
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('en', 'US'),
      ],
      locale: AppWords.locale,
      routerConfig: AppRouter().router,
    );
  }
}
