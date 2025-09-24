import 'package:flutter/material.dart';

class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color base1;
  final Color base2;
  final Color base3;
  final Color base4;
  final Color base5;
  final Color base6;

  const AppThemeColors(
      {required this.base1,
      required this.base2,
      required this.base3,
      required this.base4,
      required this.base5,
      required this.base6});

  @override
  ThemeExtension<AppThemeColors> copyWith(
      {Color? base1,
      Color? base2,
      Color? base3,
      Color? base4,
      Color? base5,
      Color? base6}) {
    return AppThemeColors(
        base1: base1 ?? this.base1,
        base2: base2 ?? this.base2,
        base3: base3 ?? this.base3,
        base4: base4 ?? this.base4,
        base5: base5 ?? this.base5,
        base6: base6 ?? this.base6);
  }

  @override
  ThemeExtension<AppThemeColors> lerp(
      covariant ThemeExtension<AppThemeColors>? other, double t) {
    if (other is! AppThemeColors) return this;
    return AppThemeColors(
        base1: Color.lerp(base1, other.base1, t)!,
        base2: Color.lerp(base2, other.base2, t)!,
        base3: Color.lerp(base3, other.base3, t)!,
        base4: Color.lerp(base4, other.base4, t)!,
        base5: Color.lerp(base5, other.base5, t)!,
        base6: Color.lerp(base6, other.base6, t)!);
  }
}
