import 'dart:typed_data';

import 'package:get_it/get_it.dart';
import 'package:habit_tracker/data/enums.dart';
import 'package:habit_tracker/features/profile/data/profile_data.dart';
import 'package:habit_tracker/features/profile/domain/profile_interface.dart';

class ProfileUseCase {
  ProfileData? _profileData;
  final _profileRepo = GetIt.instance<ProfileRepositoryInterface>();

  ProfileUseCase() {
    // _profileData = GetIt.instance<ProfileRepositoryInterface>().currentProfile;
  }

  Future<void> init() async {
    _profileData ??= await _profileRepo.getCurrentProfile().first;
  }

  Future<bool> getAvatar() async {
    if (_profileData != null) {
      if (_profileData!.avatar != null) {
        return false;
      }
    }
    return false;
    // var repo = GetIt.instance<ProfileRepositoryInterface>();
    // await repo.init();
    // if (repo.currentProfile.avatar != null) {
    //   _profileData = repo.currentProfile;
    //   return true;
    // } else {
    //   return false;
    // }
  }

  Uint8List? get avatar => _profileData?.avatar;

  DateTime? get birthDate => _profileData?.birthDate;

  String get email => _profileData?.email ?? 'not found';

  Genders? get gender => _profileData?.gender;

  String? get name => _profileData?.fullName;

  void setBirthday(DateTime date) async {
    _profileData = _profileData!.copyWith(birthDate: date);
    _profileRepo.updateProfileData({'birthDate': date.toString()});
  }

  void setEmail(String newEmail) async {
    _profileData = _profileData!.copyWith(email: newEmail);
  }

  void setGender(Genders gender) async {
    _profileData = _profileData!.copyWith(gender: gender);
    _profileRepo.updateProfileData({'gender': gender.toString()});
  }

  void setName(String newName) async {
    _profileData = _profileData!.copyWith(fullName: newName);
    _profileRepo.updateProfileData({'fullName': newName});
  }

  void setAvatar(Uint8List image) async {
    _profileData = _profileData!.copyWith(avatar: image);
  }
}
