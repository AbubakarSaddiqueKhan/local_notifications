//import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:notification_permissions/notification_permissions.dart';

import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Local_Notification {
  // var channels = const AndroidNotificationChannel(
  //   'MadniNotifications',
  //   'MadniNotifications',
  //   importance: Importance.max,
  // );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initializeSettings() {
    var androidInitialize =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    var darwinInitialize = DarwinInitializationSettings();
    var initializeSettings = InitializationSettings(
        android: androidInitialize, iOS: darwinInitialize);

    flutterLocalNotificationsPlugin.initialize(
      initializeSettings,
      onDidReceiveNotificationResponse: (details) async {
        String id = details.payload!;
      },
    );
  }

  // //fcm notification
  // ShowFCMNotification(RemoteMessage message) {
  //   var androidPlatformChannelSpacifies = const AndroidNotificationDetails(
  //     "installmentNotification",
  //     "InstallmentNotification",
  //     styleInformation: BigTextStyleInformation(""),
  //     groupKey: "installments",
  //     priority: Priority.max,
  //     importance: Importance.max,
  //     playSound: true,
  //   );
  //   NotificationDetails platformChannelSpecifies = NotificationDetails(
  //     android: androidPlatformChannelSpacifies,
  //   );
  //   flutterLocalNotificationsPlugin.show(0, message.notification?.title,
  //       message.notification?.body, platformChannelSpecifies,
  //       payload:
  //           message.data[FirebaseFieldsConstants.notification_installment_id]);
  // }

  //simple notification
  ShowNotification(String title, String subtitle) {
    var androidPlatformChannelSpacifies = const AndroidNotificationDetails(
      "my_foreground",
      "my_foreground",
      styleInformation: BigTextStyleInformation(""),
      groupKey: "installments",
      priority: Priority.max,
      importance: Importance.max,
      playSound: true,
    );
    NotificationDetails platformChannelSpecifies = NotificationDetails(
      android: androidPlatformChannelSpacifies,
    );
    flutterLocalNotificationsPlugin.show(
      0,
      title,
      subtitle,
      platformChannelSpecifies,
    );
  }
}

//notification permission
Future<void> checkNotificationPermission() async {
  Future<PermissionStatus> permissionStatus =
      NotificationPermissions.requestNotificationPermissions();
}
