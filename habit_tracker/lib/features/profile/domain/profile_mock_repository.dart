// import 'package:flutter/services.dart';
// import 'package:habit_tracker/features/profile/data/mock_profile.dart';
// import 'package:habit_tracker/features/profile/data/profile_data.dart';
// import 'package:habit_tracker/features/profile/domain/profile_interface.dart';

// class ProfileMockRepository implements ProfileRepositoryInterface {
//   ProfileData _profileData = MockProfile();

//   // @override
//   // ProfileData get currentProfile => _profileData;

//   @override
//   Future<void> initLocalData() async {
//     var res = await rootBundle.load('assets/images/mock_avatar.jpg');
//     var image = res.buffer.asUint8List();
//     _profileData = _profileData.copyWith(avatar: image);
//   }

//   @override
//   Future<bool> getProfileFromNetWork() async {
//     return true;
//   }

//   @override
//   Future<void> updateProfileData() async {
//     // ╨б╨╛╤Е╤А╨░╨╜╨╡╨╜╨╕╨╡ ╨┤╨░╨╜╨╜╤Л╤Е ╨┐╤А╨╛╤Д╨╕╨╗╤П
//     await Future.delayed(const Duration(seconds: 2));
//     return true;
//   }

//   @override
//   Future<bool> createUserProfile(ProfileData user) async {
//     _profileData = user;
//     return true;
//   }

//   @override
//   Stream<ProfileData> getCurrentProfile() {
//     // TODO: implement getCurrentProfile
//     throw UnimplementedError();
//   }
// }
