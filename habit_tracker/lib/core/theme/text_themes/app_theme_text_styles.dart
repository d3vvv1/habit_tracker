import 'package:flutter/material.dart';

class AppThemeTextStyles extends ThemeExtension<AppThemeTextStyles> {
  final TextStyle header1;
  final TextStyle header2;
  final TextStyle header3;
  final TextStyle header4;
  final TextStyle header5;
  final TextStyle header6;

  const AppThemeTextStyles({
    required this.header1,
    required this.header2,
    required this.header3,
    required this.header4,
    required this.header5,
    required this.header6,
  });

  @override
  AppThemeTextStyles copyWith({
    TextStyle? header1,
    TextStyle? header2,
    TextStyle? header3,
    TextStyle? header4,
    TextStyle? header5,
    TextStyle? header6,
  }) {
    return AppThemeTextStyles(
        header1: header1 ?? this.header1,
        header2: header2 ?? this.header2,
        header3: header3 ?? this.header3,
        header4: header4 ?? this.header4,
        header5: header5 ?? this.header5,
        header6: header6 ?? this.header6);
  }

  @override
  AppThemeTextStyles lerp(ThemeExtension<AppThemeTextStyles>? other, double t) {
    if (other is! AppThemeTextStyles) return this;
    return AppThemeTextStyles(
      header1: TextStyle.lerp(header1, other.header1, t)!,
      header2: TextStyle.lerp(header2, other.header2, t)!,
      header3: TextStyle.lerp(header3, other.header3, t)!,
      header4: TextStyle.lerp(header4, other.header4, t)!,
      header5: TextStyle.lerp(header5, other.header5, t)!,
      header6: TextStyle.lerp(header6, other.header6, t)!,
    );
  }
}
