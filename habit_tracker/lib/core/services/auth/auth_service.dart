abstract interface class AuthService {
  Future<bool> isAuthenticated();
  Future<bool> login(String userEmail, String userPassword);
  Future<bool> signUp(String userEmail, String userPassword);
  Future<void> logout();
}
