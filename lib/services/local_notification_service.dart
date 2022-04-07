import 'package:cron/cron.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context){
    const InitializationSettings initializationSettings = InitializationSettings(
        android: AndroidInitializationSettings('@drawable/app_icon'),
        iOS: IOSInitializationSettings(
          requestSoundPermission: false,
          requestBadgePermission: false,
          requestAlertPermission: false,
        )
    );
    _notificationsPlugin.initialize(initializationSettings,onSelectNotification: (String? route) async {
      if(route!=null){
        Navigator.of(context).pushNamed(route);
      }
    });
  }


  static void display(RemoteMessage message) async{

    final cron = Cron() ..schedule(Schedule.parse('*/1 * * * * *'), () async {
      try {print('message triggered');
      final id = DateTime.now().millisecondsSinceEpoch ~/1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
            "StandUp",
            "StandUp channel",
            importance: Importance.max,
            priority: Priority.high,
          ),
          iOS: IOSNotificationDetails(),
        );
        await _notificationsPlugin.show(
          id,
          message.notification!.title,
          message.notification!.body,
          notificationDetails,
          payload: message.data["route"],
        );
      } on Exception catch (e) {
        print(e);
      }
    });
    await Future.delayed(const Duration(minutes: 30));
    await cron.close();
  }
}