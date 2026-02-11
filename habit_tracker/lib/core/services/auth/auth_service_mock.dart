import 'package:habit_tracker/core/services/auth/auth_service.dart';

class AuthServiceMock implements AuthService {
  @override
  Future<bool> isAuthenticated() async {
    await Future.delayed(const Duration(seconds: 1));
    return false;
  }

  @override
  Future<bool> login(String userEmail, String userPassword) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Future<void> logout() {
    return Future.value();
  }

  @override
  Future<bool> signUp(String userEmail, String userPassword) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
