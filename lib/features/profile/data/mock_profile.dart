import 'package:flutter/material.dart';
import 'package:habit_tracker/data/enums.dart';
import 'package:habit_tracker/features/profile/data/profile_entity.dart';

class MockProfile extends ProfileEntity {
  MockProfile()
      : super(
          fullName: 'Ruslan Salakhov',
          email: 'test@mail.ru',
          birthDate: DateTime.now(),
          gender: Genders.male,
          avatar: Image.asset('assets/images/mock_avatar.jpg'),
        );
}
