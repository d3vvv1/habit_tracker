import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_tracker/di/injector.dart';
import 'package:habit_tracker/features/app_settings/domain/app_settings_irepository.dart';
import 'package:habit_tracker/habit_tracker_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider/path_provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Directory? dir = Platform.isAndroid
      ? await getExternalStorageDirectory()
      : await getApplicationSupportDirectory();

  await setupDependencies(dir);

  await GetIt.instance<IAppSettingsRepository>().init();

  runApp(const MyApp());
}
