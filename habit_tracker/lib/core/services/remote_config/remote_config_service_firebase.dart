// import 'dart:convert';

// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:habit_tracker/core/services/remote_config/remote_config_service.dart';

// class RemoteConfigServiceFirebase implements RemoteConfigService {
//   @override
//   Future<void> init() async {
//     final remoteConfig = FirebaseRemoteConfig.instance;
//     await remoteConfig.setConfigSettings(RemoteConfigSettings(
//       fetchTimeout: const Duration(minutes: 1),
//       minimumFetchInterval: const Duration(minutes: 1),
//     ));
//     await remoteConfig.fetchAndActivate();
//     final value = FirebaseRemoteConfig.instance.getAll();
//     value.forEach((key, value) {
//       _config[key] = value.asString();
//     });
//     print('RemoteConfigServiceFirebase: $_config');
//   }

//   final Map<String, dynamic> _config = {};

//   @override
//   Map<String, dynamic> getConfig(String key) {
//     final value = _config[key];
//     if (value is String) {
//       return jsonDecode(value) as Map<String, dynamic>;
//     } else {
//       return {};
//     }
//   }

//   @override
//   String getString(String key) {
//     return _config[key] as String;
//   }
// }
