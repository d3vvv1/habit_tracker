import 'package:habit_tracker/features/profile/data/profile_data.dart';
import 'package:habit_tracker/features/profile/domain/profile_interface.dart';

class ProfileRepository implements ProfileRepositoryInterface {
  ProfileData? _profileData;

  // @override
  // Future<bool> setBirthday(DateTime date) async {
  //   _profileData = _profileData!.copyWith(birthDate: date);
  //   //TODO: Добавить запись в json и локальное хранилище
  //   return true;
  // }

  // @override
  // Future<bool> setEmail(String newEmail) async {
  //   _profileData = _profileData!.copyWith(email: newEmail);
  //   //TODO: Добавить обновление в файербейс
  //   //TODO: Добавить запись в json и локальное хранилище
  //   return true;
  // }

  // @override
  // Future<bool> setGender(Genders gender) async {
  //   _profileData = _profileData!.copyWith(gender: gender);
  //   //TODO: Добавить запись в json и локальное хранилище
  //   return true;
  // }

  // @override
  // Future<bool> setName(String newName) async {
  //   _profileData = _profileData!.copyWith(fullName: name);
  //   //TODO: Добавить запись в json и локальное хранилище
  //   return true;
  // }

  // @override
  // Future<bool> setAvatar(Uint8List image) async {
  //   _profileData = _profileData!.copyWith(avatar: image);
  //   //TODO: Добавить запись в json и локальное хранилище
  //   return true;
  // }

  // @override
  // Uint8List get avatar => _profileData!.avatar!;

  // @override
  // DateTime get birthDate => _profileData!.birthDate!;

  // @override
  // String get email => _profileData!.email;

  // @override
  // Genders get gender => _profileData!.gender!;

  // @override
  // String get name => _profileData!.fullName!;

  @override
  Future<void> init() async {
    //TODO: Реализовать инициалзиацию профиля
  }

  @override
  ProfileData get profile => _profileData!;
}
