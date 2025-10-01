import 'package:flutter/material.dart';
import 'package:habit_tracker/core/theme/colors/app_theme_colors.dart';
import 'package:habit_tracker/core/theme/text_themes/app_theme_text_styles.dart';

extension BuildContextExtension on BuildContext {
  AppThemeTextStyles get appText =>
      Theme.of(this).extension<AppThemeTextStyles>()!;
  AppThemeColors get appColors => Theme.of(this).extension<AppThemeColors>()!;
}
