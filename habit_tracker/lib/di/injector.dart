import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_tracker/core/services/auth/auth_service.dart';
import 'package:habit_tracker/core/services/auth/auth_service_firebase.dart';
import 'package:habit_tracker/core/services/local_storage/local_storage_hive.dart';
import 'package:habit_tracker/core/services/local_storage/local_storage_service.dart';
import 'package:habit_tracker/features/app_settings/domain/app_settings_irepository.dart';
import 'package:habit_tracker/features/app_settings/domain/app_settings_repository.dart';
import 'package:habit_tracker/features/habits_check/domain/repositories/habit_repository_interface.dart';
import 'package:habit_tracker/features/habits_check/domain/repositories/habit_repository_mock.dart';
import 'package:habit_tracker/features/profile/domain/profile_interface.dart';
import 'package:habit_tracker/features/profile/domain/profile_repository.dart';
import 'package:hive/hive.dart';

//TODO: ╨Я╨╛╨╝╨╡╨╜╤П╤В╤М firebase ╨╕╨╜╤Б╤В╨░╨╜╤Б╤Л ╨╜╨░ ╤Б╨╡╤А╨▓╨╕╤Б
Future<void> setupDependencies(Directory? dir) async {
  if (dir != null) {
    Hive.init(dir.path);
  } else {
    throw Exception('TY EBLAN');
  }

  final getIt = GetIt.instance;

  getIt.registerSingleton<AuthService>(
    AuthServiceFirebase(),
  );

  getIt.registerSingleton<LocalStorageService>(
    LocalStorageHive(),
  );

  getIt.registerSingleton<HabitRepositoryInterface>(
    HabitRepositoryMock(),
  );

  getIt.registerSingleton<IAppSettingsRepository>(
    AppSettingsRepository(
      localStorageService: getIt<LocalStorageService>(),
      firebaseFirestore: FirebaseFirestore.instance,
    ),
  );

  getIt.registerSingleton<ProfileRepositoryInterface>(
    ProfileRepository(
      auth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance,
    ),
  );
}
