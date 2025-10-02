import 'package:flutter/services.dart';
import 'package:habit_tracker/features/profile/data/mock_profile.dart';
import 'package:habit_tracker/features/profile/data/profile_data.dart';
import 'package:habit_tracker/features/profile/domain/profile_interface.dart';

class ProfileMockRepository implements ProfileRepositoryInterface {
  ProfileData _profileData = MockProfile();

  @override
  ProfileData get profile => _profileData;

  // @override
  // Uint8List get avatar => _profileData.avatar!;

  // @override
  // DateTime get birthDate => _profileData.birthDate!;

  // @override
  // String get email => _profileData.email;

  // @override
  // Genders get gender => _profileData.gender!;

  // @override
  // String get name => _profileData.fullName!;

  @override
  Future<void> init() async {
    var res = await rootBundle.load('assets/images/mock_avatar.jpg');
    var image = res.buffer.asUint8List();
    _profileData = _profileData.copyWith(avatar: image);
  }

  // @override
  // Future<bool> setBirthday(DateTime date) async {
  //   _profileData = _profileData.copyWith(birthDate: date);
  //   return true;
  // }

  // @override
  // Future<bool> setEmail(String newEmail) async {
  //   _profileData = _profileData.copyWith(email: newEmail);
  //   return true;
  // }

  // @override
  // Future<bool> setGender(Genders gender) async {
  //   _profileData = _profileData.copyWith(gender: gender);
  //   return true;
  // }

  // @override
  // Future<bool> setName(String newName) async {
  //   _profileData = _profileData.copyWith(fullName: name);
  //   return true;
  // }

  // @override
  // Future<bool> setAvatar(Uint8List image) async {
  //   _profileData = _profileData.copyWith(avatar: image);
  //   return true;
  // }
}
