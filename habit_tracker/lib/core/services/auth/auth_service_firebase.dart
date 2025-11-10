import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_tracker/core/services/auth/auth_service.dart';
import 'package:habit_tracker/features/auth/data/basic_user_data.dart';

class AuthServiceFirebase implements AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<bool> isAuthenticated() async {
    final user = _firebaseAuth.currentUser;
    log('user: ${user?.email}');
    return user != null;
  }

  @override
  Future<bool> login(BasicUserData user) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
    return result.user != null;
  }

  @override
  Future<void> logout() {
    return _firebaseAuth.signOut();
  }

  @override
  Future<bool> signUp(BasicUserData user) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);
    return result.user != null;
  }
}
