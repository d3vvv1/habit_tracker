import 'dart:typed_data';

import 'package:habit_tracker/data/enums.dart';

abstract class ProfileInterface {
  Future<bool> setEmail(String newEmail);
  Future<bool> setName(String newName);
  Future<bool> setGender(Genders gender);
  Future<bool> setBirthday(DateTime date);
  Future<bool> setAvatar(Uint8List image);

  String get name;
  String get email;
  DateTime get birthDate;
  Genders get gender;
  Uint8List get avatar;
}
