import 'package:flutter/material.dart';
import 'package:habit_tracker/data/enums.dart';

sealed class ProfileEvent {}

class ChangeEmail extends ProfileEvent {
  final String newEmail;

  ChangeEmail({required this.newEmail});
}

class ChangeAvatar extends ProfileEvent {
  final Image newImage;

  ChangeAvatar({required this.newImage});
}

class ChangeName extends ProfileEvent {
  final String newName;

  ChangeName({required this.newName});
}

class ChangeBirthDate extends ProfileEvent {
  final DateTime newBirthDate;

  ChangeBirthDate({required this.newBirthDate});
}

class ChangeGender extends ProfileEvent {
  final Genders newGender;

  ChangeGender({required this.newGender});
}
