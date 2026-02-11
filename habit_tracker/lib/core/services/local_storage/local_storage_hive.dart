import 'package:habit_tracker/core/services/local_storage/local_storage_service.dart';
import 'package:habit_tracker/data/app_config.dart';
import 'package:habit_tracker/features/profile/data/profile_data.dart';
import 'package:hive/hive.dart';

class LocalStorageHive implements LocalStorageService {
  final String _userBox = 'user_data';
  final String _configBox = 'app_config';

  @override
  Future<ProfileData?> getCachedUserProfile() async {
    final box = await Hive.openBox(_userBox);
    final data = box.get('users');
    if (data != null) {
      // ╨Я╤А╨╡╨╛╨▒╤А╨░╨╖╨╛╨▓╨░╤В╤М ╨┤╨░╨╜╨╜╤Л╨╡ ╨╛╨▒╤А╨░╤В╨╜╨╛ ╨▓ UserProfile
      return ProfileData.fromMap(data);
    }
    return null;
  }

  @override
  Future<void> saveUserProfile(ProfileData data) async {
    final box = await Hive.openBox(_userBox);
    await box.put('users', data.toMap());
  }

  @override
  Future<AppConfigData?> getCachedAppConfig() async {
    final box = await Hive.openBox(_configBox);
    final data = box.get('appConfig');
    if (data != null) {
      Map<String, dynamic> convertedData = Map<String, dynamic>.from(data);
      return AppConfigData.fromMap(convertedData);
    }
    return null;
  }

  @override
  Future<void> saveAppConfig(AppConfigData data) async {
    final box = await Hive.openBox(_configBox);
    await box.put('appConfig', data.toMap());
  }
}
