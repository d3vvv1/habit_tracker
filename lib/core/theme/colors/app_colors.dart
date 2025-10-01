import 'package:flutter/material.dart';
import 'package:habit_tracker/core/theme/colors/app_theme_colors.dart';

class AppColors {
  static const AppThemeColors lightColors = AppThemeColors(
    base1: Color.fromRGBO(110, 106, 186, 1),
    base2: Color.fromRGBO(255, 255, 255, 1),
    base3: Color.fromRGBO(250, 250, 250, 1),
    base4: Color.fromRGBO(33, 33, 33, 1),
    base5: Color.fromRGBO(139, 135, 234, 1),
    base6: Color.fromRGBO(246, 245, 253, 1),
  );

  static const AppThemeColors darkColors = AppThemeColors(
    base1: Color.fromRGBO(110, 106, 186, 1),
    base2: Color.fromRGBO(24, 26, 32, 1),
    base3: Color.fromRGBO(31, 34, 42, 1),
    base4: Color.fromRGBO(255, 255, 255, 1),
    base5: Color.fromRGBO(139, 135, 234, 1),
    base6: Color.fromRGBO(53, 56, 63, 1),
  );
}
