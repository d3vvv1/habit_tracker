import 'package:flutter/material.dart';
import 'package:habit_tracker/core/localizations/app_words.dart';
import 'package:habit_tracker/core/routing/go_router.dart';
import 'package:habit_tracker/core/services/auth/auth_service.dart';
import 'package:habit_tracker/core/services/auth/auth_service_firebase.dart';
import 'package:habit_tracker/core/theme/app_dark_theme.dart';
import 'package:habit_tracker/core/theme/app_light_theme.dart';
import 'package:habit_tracker/core/utils/adaptive_val.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService _authService = AuthServiceFirebase();

  @override
  void initState() {
    _init();
    super.initState();
  }

  bool _isInitialized = false;
  Future<void> _init() async {
    _isInitialized = await _authService.isAuthenticated();
    setState(() {
      _isInitialized = true;
    });
    print(_isInitialized);
  }

  @override
  Widget build(BuildContext context) {
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
      routerConfig: router,
    );
  }
}
