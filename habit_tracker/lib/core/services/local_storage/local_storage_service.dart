import 'package:habit_tracker/data/app_config.dart';
import 'package:habit_tracker/features/profile/data/profile_data.dart';

abstract class LocalStorageService {
  Future<void> saveUserProfile(ProfileData data);
  Future<ProfileData?> getCachedUserProfile();
  Future<void> saveAppConfig(AppConfigData data);
  Future<AppConfigData?> getCachedAppConfig();
}
