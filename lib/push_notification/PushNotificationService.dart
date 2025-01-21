import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:html' as html;

class PushNotificationService {
// It is assumed that all messages contain a data field with the key 'type'
  Future<void> setupInteractedMessage() async {
    if (html.window.navigator.userAgent.contains("unsupported")) {
      print("This browser does not support Firebase Messaging.");
      return;
    }
    await Permission.notification.isDenied.then(
          (bool value) {
        if (value) {
          Permission.notification.request();
        }
      },
    );
    await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyDJujK6baIRwr3pdJkxKhPT29aSofC35IE",
          appId: "1:1036285532666:android:e4a6f9c2384c4ecfd0ec43",
          messagingSenderId: "1036285532666",
          projectId: "test-771d1",

        )
    );
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Get.toNamed(NOTIFICATIONS_ROUTE);
      if (message.data['type'] == 'chat') {
        // Navigator.pushNamed(context, '/chat',
        //     arguments: ChatArguments(message));
      }
    });
    enableIOSNotifications();
    await registerNotificationListeners();
  }
  Future<void> registerNotificationListeners() async {
    final AndroidNotificationChannel channel = androidNotificationChannel();
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iOSSettings =
    DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    const InitializationSettings initSettings =
    InitializationSettings(android: androidSettings, iOS: iOSSettings);
    flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) {},
    );
// onMessage is called when the app is in foreground and a notification is received
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      // homeController.getHomeData(
      //   withLoading: false,
      // );
      // print("firebase_message  $message");
      final RemoteNotification? notification = message!.notification;
      final AndroidNotification? android = message.notification?.android;
// If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              playSound: true,
              icon: android.smallIcon,
            ),
          ),
        );
      }
    });
  }
  Future<void> enableIOSNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }
  AndroidNotificationChannel androidNotificationChannel() =>
      const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description:
        'This channel is used for important notifications.', // description
        importance: Importance.max,
      );

  static Future<String>getNotificationToken() async {
    if (html.window.navigator.userAgent.contains("unsupported")) {
      print("This browser does not support Firebase Messaging.");
      return "";
    }
    var firebaseToken = await FirebaseMessaging.instance.getToken();
    print(firebaseToken);
    return firebaseToken??"";
    // MySharedPreference.setFirebaseToken(firebaseToken.toString());
  }
}