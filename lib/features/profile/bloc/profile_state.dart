import 'package:flutter/material.dart';
import 'package:habit_tracker/data/enums.dart';
import 'package:habit_tracker/features/profile/data/profile_entity.dart';

sealed class ProfileState {}

class InitProfile extends ProfileState {
  final ProfileEntity profile;

  InitProfile({required this.profile});
}

class AvatarChanged extends ProfileState {
  final Image newAvatar;

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
