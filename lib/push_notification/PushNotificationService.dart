import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kalakar/controller/auth_page_controller.dart';
import 'package:kalakar/controller/requirement_controller.dart';
import 'package:kalakar/helper/route_helper.dart';
import 'package:permission_handler/permission_handler.dart';

import '../data/local_database/login_table.dart';

// import 'dart:html' as html;
void onBackgroundNotificationResponse(NotificationResponse message) async {
  if (message.payload != null) {
    Map<String, dynamic> tempMap = jsonDecode(message.payload!);
    print(jsonDecode(message.payload.toString()));
    print("tempMap");

    print(tempMap["NotifyType"]);
    if (tempMap['NotifyType'] == 'RequirmentstatusChanges') {
      int requirementID = int.tryParse(tempMap['RequirementID'] ?? '0') ?? 0;
      if (requirementID > 0) {
        // Navigate to requirement details screen
        RequirementController controller = Get.put(RequirementController());
        controller.getAppliedForRequirementArtist(requirementID);
        controller.showStatus = true;
        Get.toNamed(RouteHelper.requirementViewPage);
      }
    }
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // if (message.data.isNotEmpty) {
  //   print("Handling background message: ${message.data}");
  //   handleNotificationData(message.data);
  // }
}

Future<void> handleNotificationData(Map<String, dynamic> data) async {
  // if (data['NotifyType'] == 'RequirmentstatusChanges') {
  //   int requirementID = int.tryParse(data['RequirementID'] ?? '0') ?? 0;
  //   if (requirementID > 0) {
  //     await Hive.initFlutter();
  //     Hive.registerAdapter(LoginTableAdapter());
  //     await Hive.openBox<LoginTable>("loginBox");
  //     RequirementController controller = Get.put(RequirementController());
  //     controller.getAppliedForRequirementArtist(requirementID);
  //     controller.showStatus = true;
  //     Future.delayed(Duration.zero,(){
  //       Get.toNamed(RouteHelper.requirementViewPage);
  //
  //     });
  //   }
  // }
}

class PushNotificationService {
// It is assumed that all messages contain a data field with the key 'type'
  Future<void> setupInteractedMessage() async {
    // if (html.window.navigator.userAgent.contains("unsupported")) {
    //   print("This browser does not support Firebase Messaging.");
    //   return;
    // }
    await Permission.notification.isDenied.then(
      (bool value) {
        if (value) {
          Permission.notification.request();
        }
      },
    );
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyDOn6hclgqDR7CctKxGC6DFBlGKBXea47c",
      appId: "1:139795519514:android:7ce53d0287db78feef99a3",
      messagingSenderId: "139795519514",
      projectId: "kalakaar-8a2e5",
    ));
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Get.toNamed(NOTIFICATIONS_ROUTE);
      print(message.data['NotifyType']);
      print(message.data);
      if (message.data.containsKey('NotifyType')) {
        if (message.data['NotifyType'] == 'RequirmentstatusChanges') {
          int requirementID =
              int.tryParse(message.data['RequirementID'] ?? '0') ?? 0;
          if (requirementID > 0) {
            // Navigate to requirement details screen
            print(Get.routing.current);
            if (Get.routing.current.isNotEmpty) {
              if (requirementID > 0) {
                // Navigate to requirement details screen
                RequirementController controller =
                    Get.put(RequirementController());
                controller.getAppliedForRequirementArtist(requirementID);
                controller.showStatus = true;
                Get.toNamed(RouteHelper.requirementViewPage);
              }
            }
            AuthPageController authPageController =
                Get.put(AuthPageController());
            authPageController.requirementID = requirementID;
            authPageController.isNotification = true;
          }
        }
      }
    });
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

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
    flutterLocalNotificationsPlugin.initialize(initSettings,
        onDidReceiveNotificationResponse: onBackgroundNotificationResponse,
        onDidReceiveBackgroundNotificationResponse:
            onBackgroundNotificationResponse);
// onMessage is called when the app is in foreground and a notification is received
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      // homeController.getHomeData(
      //   withLoading: false,
      // );
      print("firebase_message  $message");
      final RemoteNotification? notification = message!.notification;
      final AndroidNotification? android = message.notification?.android;
// If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        Map<String, dynamic> data = message.data;
        print(data["NotifyType"].runtimeType);
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
            payload: jsonEncode(data));
      }
    });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print("🔹 Notification tapped while app is open: ${message.data}");
    //   // _handleMessage(message);
    // });
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

  static Future<String> getNotificationToken() async {
    // if (html.window.navigator.userAgent.contains("unsupported")) {
    //   print("This browser does not support Firebase Messaging.");
    //   return "";
    // }
    var firebaseToken = await FirebaseMessaging.instance.getToken();
    print(firebaseToken);
    return firebaseToken ?? "";
    // MySharedPreference.setFirebaseToken(firebaseToken.toString());
  }
}
