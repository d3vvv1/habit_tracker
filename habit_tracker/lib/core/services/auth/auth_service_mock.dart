import 'package:habit_tracker/core/services/auth/auth_service.dart';
import 'package:habit_tracker/features/auth/data/basic_user_data.dart';

class AuthServiceMock implements AuthService {
  @override
  Future<bool> isAuthenticated() async {
    await Future.delayed(const Duration(seconds: 1));
    return false;
  }

  @override
  Future<bool> login(BasicUserData user) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Future<void> logout() {
    return Future.value();
  }

  @override
  Future<bool> signUp(BasicUserData user) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
