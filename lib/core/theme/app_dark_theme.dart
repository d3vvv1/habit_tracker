import 'package:flutter/material.dart';
import 'package:habit_tracker/core/theme/colors/app_colors.dart';
import 'package:habit_tracker/core/theme/text_themes/app_text_styles.dart';

ThemeData createDarkTheme() {
  return ThemeData(extensions: const <ThemeExtension<dynamic>>[
    AppTextStyles.darkTextStyles,
    AppColors.darkColors,
  ]);
}
