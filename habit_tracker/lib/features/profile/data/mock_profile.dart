import 'package:habit_tracker/data/enums.dart';
import 'package:habit_tracker/features/profile/data/profile_data.dart';

class MockProfile extends ProfileData {
  MockProfile()
      : super(
          fullName: 'Ruslan Salakhov',
          email: 'yaRuslan@mail.com',
          password: '1234567890',
          birthDate: DateTime.now(),
          gender: Genders.male,
          avatar: null,
          //avatar: rootBundle.load('assets/images/mock_avatar.jpg').,
        );
}
