import 'package:habit_tracker/features/profile/data/profile_data.dart';

abstract class ProfileRepositoryInterface {
  Future<void> init();
  ProfileData get profile;
  // Future<bool> setEmail(String newEmail);
  // Future<bool> setName(String newName);
  // Future<bool> setGender(Genders gender);
  // Future<bool> setBirthday(DateTime date);
  // Future<bool> setAvatar(Uint8List image);

  // String get name;
  // String get email;
  // DateTime get birthDate;
  // Genders get gender;
  // Uint8List get avatar;
}
