import 'package:flutter/material.dart';
import 'package:habit_tracker/di/injector.dart';
import 'package:habit_tracker/habit_tracker_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupDependencies();

  runApp(const MyApp());
}
