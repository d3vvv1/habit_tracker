import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_tracker/core/services/auth/auth_service.dart';
import 'package:habit_tracker/features/profile/domain/profile_interface.dart';

class AuthServiceFirebase implements AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<bool> isAuthenticated() async {
    final user = _firebaseAuth.currentUser;
    log('user: ${user?.email}');
    return user != null;
  }

  @override
  Future<bool> login(String userEmail, String userPassword) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
      email: userEmail,
      password: userPassword,
    );
    return result.user != null;
  }

  @override
  Future<void> logout() {
    return _firebaseAuth.signOut();
  }

  @override
  Future<bool> signUp(String userEmail, String userPassword) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: userEmail, password: userPassword);
    if (result.user != null) {
      GetIt.instance<ProfileRepositoryInterface>()
          .createUserProfile(result.user!); //TODO: ╨б╨┤╨╡╨╗╨░╤В╤М ╨┐╨╛╨╗╤Г╤З╤И╨╡
    }
    return result.user != null;
  }
}
