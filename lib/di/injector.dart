import 'package:get_it/get_it.dart';
import 'package:habit_tracker/core/services/auth/auth_service.dart';
import 'package:habit_tracker/core/services/auth/auth_service_firebase.dart';

void setupDependencies() {
  final getIt = GetIt.instance;

  getIt.registerSingleton<AuthService>(
    AuthServiceFirebase(),
  );
}
