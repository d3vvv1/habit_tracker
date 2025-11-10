import 'package:flutter/material.dart';
import 'package:habit_tracker/core/theme/text_themes/app_theme_text_styles.dart';

class AppTextStyles {
  static const AppThemeTextStyles lightTextStyle = AppThemeTextStyles(
      header1: TextStyle(
        color: Colors.black,
        fontFamily: 'Roboto',
        fontSize: 40,
        fontWeight: FontWeight.w800,
      ),
      header2: TextStyle(
        color: Colors.black,
        fontFamily: 'Roboto',
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      header3: TextStyle(
        color: Colors.black,
        fontFamily: 'Roboto',
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      header4: TextStyle(
        color: Colors.black,
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      header5: TextStyle(
        color: Colors.black,
        fontFamily: 'Roboto',
        fontSize: 8,
        fontWeight: FontWeight.w500,
      ),
      header6: TextStyle(
        color: Colors.black,
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ));

  static const AppThemeTextStyles darkTextStyles = AppThemeTextStyles(
      header1: TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontSize: 40,
        fontWeight: FontWeight.w800,
      ),
      header2: TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      header3: TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      header4: TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      header5: TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontSize: 8,
        fontWeight: FontWeight.w500,
      ),
      header6: TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ));
}
