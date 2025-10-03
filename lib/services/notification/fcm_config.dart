
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:my_app/services/notification/notification_service.dart';


class NotificationHandler {
  static Future<void> initFCM() async {
    // For iOS, try a more immediate approach first
    if (Platform.isIOS) {
      await _initFCMForIOS();
    } else {
      await _initFCMStandard();
    }
  }

  static Future<void> _initFCMStandard() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // iOS: Ask permission
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print("✅ Notification permission: ${settings.authorizationStatus}");

    // For iOS, try to wait for APNS token but don't block indefinitely
    if (Platform.isIOS) {
      await _waitForAPNSToken(messaging);
    }

    // FCM Token - with comprehensive fallback
    String? token;
    int fcmRetries = 0;
    const maxFcmRetries = 3;
    
    while (fcmRetries < maxFcmRetries) {
      try {
        token = await messaging.getToken();
        if (token != null && token.isNotEmpty) {
          print("📱 FCM Token: $token");
          break;
        } else {
          print("🔄 FCM token is null or empty (attempt ${fcmRetries + 1})");
        }
      } catch (e) {
        print("❌ FCM token failed (attempt ${fcmRetries + 1}): $e");
        
        if (Platform.isIOS && fcmRetries < maxFcmRetries - 1) {
          print("⏳ Waiting before FCM retry...");
          await Future.delayed(Duration(seconds: 3 + fcmRetries * 2));
        }
      }
      
      fcmRetries++;
    }
    
    if (token == null || token.isEmpty) {
      print("⚠️ Could not obtain FCM token after $maxFcmRetries attempts");
      print("💡 App will continue without push notifications");
    }

    // Set up message handlers
    _setupMessageHandlers();
  }

  static Future<void> _waitForAPNSToken(FirebaseMessaging messaging) async {
    print("🍎 Waiting for APNS token...");
    
    // First, wait a bit longer for the iOS system to register
    await Future.delayed(const Duration(seconds: 3));
    
    int maxRetries = 15; // Increased retries
    int retryCount = 0;
    
    while (retryCount < maxRetries) {
      try {
        String? apnsToken = await messaging.getAPNSToken();
        if (apnsToken != null && apnsToken.isNotEmpty) {
          print("✅ APNS Token received: ${apnsToken.substring(0, 20)}...");
          return;
        } else {
          print("🔄 APNS token is null or empty (attempt ${retryCount + 1})");
        }
      } catch (e) {
        print("❌ Error getting APNS token (attempt ${retryCount + 1}): $e");
      }
      
      retryCount++;
      if (retryCount < maxRetries) {
        print("⏳ APNS token not ready, waiting... (${retryCount}/$maxRetries)");
        // Longer delays between attempts
        await Future.delayed(Duration(seconds: 2 + retryCount));
      }
    }
    
    print("⚠️ APNS token not available after $maxRetries attempts, proceeding anyway...");
    print("💡 This might be normal if running on simulator or if notifications are disabled");
  }

  static Future<void> _initFCMForIOS() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Request permission first
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print("✅ iOS Notification permission: ${settings.authorizationStatus}");

    // Try to get FCM token immediately without waiting for APNS
    try {
      String? token = await messaging.getToken();
      if (token != null && token.isNotEmpty) {
        print("📱 FCM Token (iOS immediate): $token");
      } else {
        print("🔄 FCM token is null, will retry later...");
      }
    } catch (e) {
      print("❌ FCM token failed (iOS immediate): $e");
      print("💡 This is expected if APNS token is not ready yet");
    }

    // Set up message handlers
    _setupMessageHandlers();
  }

  static void _setupMessageHandlers() {
    // Foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("📬 Foreground message: ${message.messageId}");
      if (message.notification != null) {
        LocalNotificationService.showNotification(message);
      }
    });

    // When app is opened from background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("📲 Notification tapped (background): ${message.messageId}");
    });

    // When app is launched from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print("🚀 App launched via notification: ${message.messageId}");
      }
    });
  }
}


