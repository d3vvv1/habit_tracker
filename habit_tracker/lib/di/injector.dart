import 'package:get_it/get_it.dart';
import 'package:habit_tracker/core/services/auth/auth_service.dart';
import 'package:habit_tracker/core/services/auth/auth_service_firebase.dart';
import 'package:habit_tracker/features/habits_check/domain/repositories/habit_repository_interface.dart';
import 'package:habit_tracker/features/habits_check/domain/repositories/habit_repository_mock.dart';
import 'package:habit_tracker/features/profile/domain/profile_interface.dart';
import 'package:habit_tracker/features/profile/domain/profile_mock_repository.dart';

void setupDependencies() {
  final getIt = GetIt.instance;

  getIt.registerSingleton<AuthService>(
    AuthServiceFirebase(),
  );

  getIt.registerSingleton<HabitRepositoryInterface>(
    HabitRepositoryMock(),
  );

  getIt.registerSingleton<ProfileRepositoryInterface>(
    ProfileMockRepository(),
  );
}
