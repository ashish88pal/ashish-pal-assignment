import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  Future<void> setupInteractedMessage() async {
    await Firebase.initializeApp();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    });



    await enableIOSNotifications();
    await registerNotificationListeners();
  }

  registerNotificationListeners() async {
    final AndroidNotificationChannel channel = androidNotificationChannel();
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    // IOSInitializationSettings DarwinInitializationSettings
    const iOSSettings = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );
    const initSetttings =
        InitializationSettings(android: androidSettings, iOS: iOSSettings);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        // onSelectNotification onDidReceiveNotificationResponse
        onDidReceiveNotificationResponse: (message) async {
      // This function handles the click in the notification when the app is in foreground
      // Get.toNamed(NOTIFICATIOINS_ROUTE);
    });

    /// ----------------------------------onMESSAGE_RECIEVED-------------------------
// onMessage is called when the app is in foreground and a notification is received
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {

      final RemoteNotification? notification = message.notification;
      final AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              enableVibration: true,
              channelDescription: channel.description,
              icon: android.smallIcon,
              playSound: true,
            ),
          ),
        );
      }
    });
  }

  enableIOSNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }

  androidNotificationChannel() => const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description:
            'This channel is used for important notifications.', // description
        importance: Importance.max,
      );
}
