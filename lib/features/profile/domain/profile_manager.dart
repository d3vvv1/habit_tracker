import 'package:flutter/material.dart';
import 'package:habit_tracker/data/enums.dart';
import 'package:habit_tracker/features/profile/data/profile_entity.dart';

class ProfileManager {
  ProfileEntity _profileData;

  ProfileManager({required ProfileEntity profileData})
      : _profileData = profileData;

  ProfileEntity get profile => _profileData;

  void changeAvatar(Image newAvatar) {
    _profileData.copyWith(
      avatar: newAvatar,
    );
  }

  void changeEmail(String newEmail) {
    _profileData.copyWith(email: newEmail);
  }

  void changeBirthDate(DateTime newBirthDate) {
    _profileData.copyWith(birthDate: newBirthDate);
  }

  void changeName(String newName) {
    _profileData = _profileData.copyWith(fullName: newName);
  }

  void changeGender(Genders newGender) {
    _profileData = _profileData.copyWith(gender: newGender);
  }
}
