// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:habit_tracker/core/utils/theme_mode_extension.dart';

class AppConfigData {
  final ThemeMode themeMode;
  final String localeCode;

  AppConfigData({
    required this.themeMode,
    required this.localeCode,
  });

  AppConfigData.byDefault()
      : themeMode = ThemeMode.system,
        localeCode = 'en';

  AppConfigData copyWith({
    ThemeMode? themeMode,
    String? localeCode,
  }) {
    return AppConfigData(
      themeMode: themeMode ?? this.themeMode,
      localeCode: localeCode ?? this.localeCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'themeMode': themeMode.getThemeModeCode(),
      'localeCode': localeCode,
    };
  }

  factory AppConfigData.fromMap(Map<String, dynamic> map) {
    return AppConfigData(
      themeMode: ThemeModeExtension.getThemeModeByCode(map['themeMode'] as int),
      localeCode: map['localeCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppConfigData.fromJson(String source) =>
      AppConfigData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AppConfigData(themeMode: $themeMode, localeCode: $localeCode)';

  @override
  bool operator ==(covariant AppConfigData other) {
    if (identical(this, other)) return true;

    return other.themeMode == themeMode && other.localeCode == localeCode;
  }

  @override
  int get hashCode => themeMode.hashCode ^ localeCode.hashCode;
}
