// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:my_app/services/notification/notification_service.dart';


// class NotificationHandler {
//   static Future<void> initFCM() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;

//     // Request permission for iOS and Android 13+
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     print("✅ Notification permission: ${settings.authorizationStatus}");

//     // Get FCM Token
//     String? token = await messaging.getToken();
//     print("📱 FCM Token: $token");

//     // Foreground messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print("📬 Foreground message received: ${message.messageId}");
//       if (message.notification != null) {
//         LocalNotificationService.showNotification(message);
//       }
//     });

//     // When app is opened from a notification (background)
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print("📲 Message clicked! ${message.messageId}");
//     });
//   }
// }
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:my_app/services/notification/notification_service.dart';


// class NotificationHandler {
//   static Future<void> initFCM() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;

//     // iOS: Ask permission
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     print("✅ Notification permission: ${settings.authorizationStatus}");

//     // FCM Token
//     String? token = await messaging.getToken();
//     print("📱 FCM Token: $token");

//     // Foreground
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print("📬 Foreground message: ${message.messageId}");
//       if (message.notification != null) {
//         LocalNotificationService.showNotification(message);
//       }
//     });

//     // When app is opened from background
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print("📲 Notification tapped (background): ${message.messageId}");
//     });

//     // When app is launched from terminated state
//     FirebaseMessaging.instance.getInitialMessage().then((message) {
//       if (message != null) {
//         print("🚀 App launched via notification: ${message.messageId}");
//       }
//     });
//   }
// }


