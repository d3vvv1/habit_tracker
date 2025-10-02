import 'dart:typed_data';

import 'package:habit_tracker/data/enums.dart';

sealed class ProfileState {}

class InitalState extends ProfileState {}

class InitProfile extends ProfileState {
  final String? fullName;
  final String email;
  final Genders? gender;
  final DateTime? birthDate;
  final Uint8List? avatar;

  InitProfile({
    required this.fullName,
    required this.gender,
    required this.birthDate,
    required this.avatar,
    required this.email,
  });
}

class Loading extends ProfileState {}

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
