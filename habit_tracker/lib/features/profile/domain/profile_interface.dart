import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_tracker/features/profile/data/profile_data.dart';

abstract class ProfileRepositoryInterface {
  /// ╨Ш╨╜╨╕╤Ж╨╕╨░╨╗╨╕╨╖╨░╤Ж╨╕╤П ╨┐╤А╨╛╤Д╨╕╨╗╤П ╨╕╨╖ ╨║╤Н╤И╨░/╨╗╨╛╨░╨║╨╗╤М╨╜╨╛╨│╨╛ ╤Е╤А╨░╨╜╨╡╨╜╨╕╤П
  Future<void> initLocalData();

  /// ╨Я╨╛╨╗╤Г╤З╨╕╤В╤М ╨┐╤А╨╛╤Д╨╕╨╗╤М ╨╕╨╖ ╤Б╨╡╤В╨╕
  Stream<ProfileData> getCurrentProfile();

  /// ╨Ю╨▒╨╜╨╛╨▓╨╗╨╡╨╜╨╕╨╡ ╨┤╨░╨╜╨╜╤Л╤Е ╨┐╤А╨╛╤Д╨╕╨╗╤П ╨╜╨░ ╤Б╨╡╤А╨▓╨╡╤А╨╡ ╨╕ ╨╗╨╛╨║╨░╨╗╤М╨╜╨╛
  Future<void> updateProfileData(Map<String, dynamic> updates);

  /// ╨б╨╛╨╖╨┤╨░╨╜╨╕╨╡ ╨┐╤А╨╛╤Д╨╕╨╗╤П ╨┐╨╛╨╗╤М╨╖╨╛╨▓╨░╤В╨╡╨╗╤П
  Future<void> createUserProfile(User user);
}
