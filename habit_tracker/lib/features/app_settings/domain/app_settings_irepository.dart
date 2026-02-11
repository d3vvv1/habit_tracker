import 'package:flutter/material.dart';
import 'package:habit_tracker/data/app_config.dart';

abstract class IAppSettingsRepository {
  /// ╨Ш╨╜╨╕╤Ж╨╕╨░╨╗╨╕╨╖╨░╤Ж╨╕╤П ╤А╨╡╨┐╨╛╨╖╨╕╤В╨╛╤А╨╕╤П
  Future<void> init();

  /// ╨б╨╛╤Е╤А╨░╨╜╨╡╨╜╨╕╨╡ ╨╕╨╖╨╝╨╡╨╜╨╡╨╜╨╕╨╣ ╨╗╨╛╨║╨░╨╗╨╕
  Future<void> saveLocaleCodeChange(String localeCode);

  /// ╨б╨╛╤Е╤А╨░╨╜╨╡╨╜╨╕╨╡ ╨╕╨╖╨╝╨╡╨╜╨╡╨╜╨╜╨╕╨╣ ╤А╨╡╨╢╨╕╨╝╨░ ╤В╨╡╨╝╤Л
  Future<void> saveThemeChange(ThemeMode themeMode);

  /// ╨Ю╨▒╨╜╨╛╨▓╨╕╤В╤М ╨║╨╛╨╜╤Д╨╕╨│ ╤Б ╤Б╨╡╤А╨▓╨╡╤А╨░
  Future<void> updateServerConfig(AppConfigData data);

  /// ╨Я╨╛╨╗╤Г╤З╨╡╨╜╨╕╨╡ ╨║╨╛╨╜╤Д╨╕╨│╨░ ╤Б ╤Б╨╡╤А╨▓╨╡╤А╨░
  Future<AppConfigData?> getCachedServerConfig();

  /// ╨а╨╡╨╢╨╕╨╝ ╤В╨╡╨╝╤Л ╨╕╨╖ ╨║╨╛╨╜╤Д╨╕╨│╨░
  ThemeMode getThemeMode();

  /// ╨Ы╨╛╨║╨░╨╗╤М ╨╕╨╖ ╨║╨╛╨╜╤Д╨╕╨│╨░
  String getAppLocaleCode();

  /// ╨б╨╕╨╜╤Е╤А╨╛╨╜╨╕╨╖╨╕╤А╨╛╨▓╨░╤В╤М ╨╗╨╛╨║╨░╨╗╤М╨╜╤Л╨╣ ╨║╨╛╨╜╤Д╨╕╨│ ╨╕ ╤Б╨╡╤А╨▓╨╡╤А╨╜╤Л╨╣
  Future<void> syncLocalAndFirestore();

  /// ╨Ы╨╛╨║╨░╨╗╤М ╨╕╨╖ ╨║╨╛╨╜╤Д╨╕╨│╨░
  // Future<AppConfigData> fetchServerConfig();
}
