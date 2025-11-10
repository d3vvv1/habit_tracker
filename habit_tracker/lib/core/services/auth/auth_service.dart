import 'package:habit_tracker/features/auth/data/basic_user_data.dart';

abstract interface class AuthService {
  Future<bool> isAuthenticated();
  Future<bool> login(BasicUserData user);
  Future<bool> signUp(BasicUserData user);
  Future<void> logout();
}
