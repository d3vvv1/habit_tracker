// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

import 'package:habit_tracker/data/enums.dart';

class ProfileData {
  final String email;
  final String? fullName;
  final Genders? gender;
  final DateTime? birthDate;
  final Uint8List? avatar;

  ProfileData({
    required this.email,
    required this.fullName,
    required this.gender,
    required this.birthDate,
    required this.avatar,
  });

  // ProfileData.fromUser(BasicUserData user)
  //     : fullName = null,
  //       gender = null,
  //       birthDate = null,
  //       avatar = null,
  //       super(
  //         email: user.email,
  //         password: user.password,
  //       );

  ProfileData copyWith({
    String? fullName,
    Genders? gender,
    DateTime? birthDate,
    Uint8List? avatar,
    String? email,
  }) {
    return ProfileData(
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'fullName': fullName,
      'gender': gender?.toString(),
      'birthDate': birthDate?.millisecondsSinceEpoch,
      'avatar': avatar,
    };
  }

  factory ProfileData.fromMap(Map<String, dynamic> map) {
    return ProfileData(
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      gender: map['gender'] != null
          ? Genders.fromString((map['gender'] as String).toLowerCase())
          : null,
      birthDate: map['birthDate'] != null
          ? DateTime.parse(map['birthDate'] as String)
          : null,
      avatar: map['avatar'] != null ? map['avatar'] as Uint8List : null,
      email: map['email'] != null ? map['email'] as String : 'empty',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileData.fromJson(String source) =>
      ProfileData.fromMap(json.decode(source) as Map<String, dynamic>);
}
