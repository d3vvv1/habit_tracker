import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/core/services/local_storage/local_storage_service.dart';
import 'package:habit_tracker/data/app_config.dart';
import 'package:habit_tracker/features/app_settings/domain/app_settings_irepository.dart';

class AppSettingsRepository implements IAppSettingsRepository {
  final LocalStorageService _localStorageService;
  final FirebaseFirestore _firestore;
  late AppConfigData _configData;
  final String _configCollection = 'app_config';

  AppSettingsRepository({
    required LocalStorageService localStorageService,
    required FirebaseFirestore firebaseFirestore,
  })  : _localStorageService = localStorageService,
        _firestore = firebaseFirestore;

  @override
  Future<void> init() async {
    _configData = await _localStorageService.getCachedAppConfig() ??
        AppConfigData.byDefault();
  }

  @override
  ThemeMode getThemeMode() {
    return _configData.themeMode;
  }

  @override
  String getAppLocaleCode() {
    return _configData.localeCode;
  }

  @override
  Future<AppConfigData?> getCachedServerConfig() async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity.first == ConnectivityResult.none) {
      throw Exception('NO CONNECTION');
    }

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('UNAUTHORIZED');
    }

    try {
      final doc =
          await _firestore.collection(_configCollection).doc(user.uid).get();

      if (doc.exists) {
        if (doc.data() != null) {
          final configFromServer = AppConfigData.fromMap(doc.data()!);
          return configFromServer;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> updateServerConfig(AppConfigData data) async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity.first == ConnectivityResult.none) {
      throw Exception('NO CONNECTION');
    }

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('UNAUTHORIZED');
    }
    try {
      await _firestore
          .collection(_configCollection)
          .doc(user.uid)
          .update(data.toMap());
    } catch (e) {
      print('╨Ю╤И╨╕╨▒╨║╨░ ╤Б╨╕╨╜╤Е╤А╨╛╨╜╨╕╨╖╨░╤Ж╨╕╨╕ ╨╜╨░╤Б╤В╤А╨╛╨╡╨║: $e');
    }
  }

  @override
  Future<void> saveLocaleCodeChange(String localeCode) async {
    _configData = _configData.copyWith(localeCode: localeCode);
    _localStorageService.saveAppConfig(_configData);
    updateServerConfig(_configData);
    // syncLocalAndFirestore();
  }

  @override
  Future<void> saveThemeChange(ThemeMode themeMode) async {
    _configData = _configData.copyWith(themeMode: themeMode);
    _localStorageService.saveAppConfig(_configData);
    updateServerConfig(_configData);

    // syncLocalAndFirestore();
  }

  @override
  Future<void> syncLocalAndFirestore() async {
    // final serverData = await getCachedServerConfig();
    // if (serverData == null) {
    //   await _firestore.doc(_configCollection).set(_configData.toMap());
    // } else {
    //   if (serverData != _configData) {
    //     await _firestore.doc(_configCollection).set(_configData.toMap());
    //   }
    // }
  }
}
