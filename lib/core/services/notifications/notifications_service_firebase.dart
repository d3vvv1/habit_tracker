// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:habit_tracker/core/services/notifications/notifications_service.dart';

// class NotificationsServiceFirebase implements NotificationsService {
//   @override
//   Future<void> init() async {
//     await FirebaseMessaging.instance.requestPermission();
//     final fcmToken = await FirebaseMessaging.instance.getToken();
//     print('FCM Token: $fcmToken');
//   }

//   @override
//   Stream<String> get onMessage => FirebaseMessaging.onMessage.map((message) => message.data.toString());
// }
