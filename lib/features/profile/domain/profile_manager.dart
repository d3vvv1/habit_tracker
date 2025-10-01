import 'dart:typed_data';

import 'package:habit_tracker/data/enums.dart';
import 'package:habit_tracker/features/profile/data/mock_profile.dart';
import 'package:habit_tracker/features/profile/data/profile_data.dart';
import 'package:habit_tracker/features/profile/domain/profile_interface.dart';

class ProfileManager implements ProfileInterface {
  ProfileData _profileData = MockProfile();

  @override
  Future<bool> setBirthday(DateTime date) async {
    _profileData = _profileData.copyWith(birthDate: date);
    //TODO: Добавить запись в json и локальное хранилище
    return true;
  }

  @override
  Future<bool> setEmail(String newEmail) async {
    _profileData = _profileData.copyWith(email: newEmail);
    //TODO: Добавить обновление в файербейс
    //TODO: Добавить запись в json и локальное хранилище
    return true;
  }

  @override
  Future<bool> setGender(Genders gender) async {
    _profileData = _profileData.copyWith(gender: gender);
    //TODO: Добавить запись в json и локальное хранилище
    return true;
  }

  @override
  Future<bool> setName(String newName) async {
    _profileData = _profileData.copyWith(fullName: name);
    //TODO: Добавить запись в json и локальное хранилище
    return true;
  }

  @override
  Future<bool> setAvatar(Uint8List image) async {
    _profileData = _profileData.copyWith(avatar: image);
    //TODO: Добавить запись в json и локальное хранилище
    return true;
  }

  @override
  // TODO: implement avatar
  Uint8List get avatar => throw UnimplementedError();

  @override
  // TODO: implement birthDate
  DateTime get birthDate => throw UnimplementedError();

  @override
  // TODO: implement email
  String get email => throw UnimplementedError();

  @override
  // TODO: implement gender
  Genders get gender => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
}
