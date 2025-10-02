import 'dart:typed_data';

import 'package:get_it/get_it.dart';
import 'package:habit_tracker/data/enums.dart';
import 'package:habit_tracker/features/profile/data/profile_data.dart';
import 'package:habit_tracker/features/profile/domain/profile_interface.dart';

class ProfileUseCase {
  ProfileData? _profileData;

  ProfileUseCase() {
    GetIt.instance<ProfileRepositoryInterface>().init();
    _profileData = GetIt.instance<ProfileRepositoryInterface>().profile;
  }

  Future<bool> getAvatar() async {
    var repo = GetIt.instance<ProfileRepositoryInterface>();
    await repo.init();
    if (repo.profile.avatar != null) {
      _profileData = repo.profile;
      return true;
    } else {
      return false;
    }
  }

  Uint8List? get avatar => _profileData!.avatar;

  DateTime? get birthDate => _profileData!.birthDate;

  String get email => _profileData!.email;

  Genders? get gender => _profileData!.gender;

  String? get name => _profileData!.fullName;

  void setBirthday(DateTime date) async {
    _profileData = _profileData!.copyWith(birthDate: date);
  }

  void setEmail(String newEmail) async {
    _profileData = _profileData!.copyWith(email: newEmail);
  }

  void setGender(Genders gender) async {
    _profileData = _profileData!.copyWith(gender: gender);
  }

  void setName(String newName) async {
    _profileData = _profileData!.copyWith(fullName: name);
  }

  void setAvatar(Uint8List image) async {
    _profileData = _profileData!.copyWith(avatar: image);
  }
}
