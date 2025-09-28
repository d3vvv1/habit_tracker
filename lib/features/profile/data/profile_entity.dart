import 'package:flutter/material.dart';
import 'package:habit_tracker/data/enums.dart';

class ProfileEntity {
  final String email;
  final String? fullName;
  final Genders? gender;
  final DateTime? birthDate;
  final Image? avatar;

  ProfileEntity(
      {required this.email,
      required this.fullName,
      required this.gender,
      required this.birthDate,
      required this.avatar});

  ProfileEntity copyWith({
    String? email,
    String? fullName,
    Genders? gender,
    DateTime? birthDate,
    Image? avatar,
  }) {
    return ProfileEntity(
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
        avatar: avatar ?? this.avatar);
  }
}
