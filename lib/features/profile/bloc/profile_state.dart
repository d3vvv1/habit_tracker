import 'dart:typed_data';

import 'package:habit_tracker/data/enums.dart';
import 'package:habit_tracker/features/profile/data/profile_data.dart';

sealed class ProfileState {}

class Test extends ProfileState {}

class InitProfile extends ProfileState {
  final ProfileData profile;

  InitProfile({required this.profile});
}

class AvatarChanged extends ProfileState {
  final Uint8List newAvatar;

  AvatarChanged({required this.newAvatar});
}

class EmailChanged extends ProfileState {
  final String newEmail;

  EmailChanged({required this.newEmail});
}

class NameChanged extends ProfileState {
  final String newName;

  NameChanged({required this.newName});
}

class GenderChanged extends ProfileState {
  final Genders newGender;

  GenderChanged({required this.newGender});
}

class BirthDateChanged extends ProfileState {
  final DateTime newBirthDate;

  BirthDateChanged({required this.newBirthDate});
}
