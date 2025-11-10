import 'package:flutter/material.dart';
import 'package:habit_tracker/core/theme/colors/app_colors.dart';
import 'package:habit_tracker/core/theme/text_themes/app_text_styles.dart';

ThemeData createLightTheme() {
  return ThemeData(extensions: const <ThemeExtension<dynamic>>[
    AppTextStyles.lightTextStyle,
    AppColors.lightColors,
  ]);
}
