import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_tigasatu/ui/detail_page.dart';
import 'package:flutter_tigasatu/ui/home_page.dart';
import 'package:flutter_tigasatu/utils/notification_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper notificationHelper = NotificationHelper();

  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  notificationHelper.requestAndroidPermissions(flutterLocalNotificationsPlugin);
  notificationHelper.requestIOSPermissions(flutterLocalNotificationsPlugin);zz

  runApp(
    MaterialApp(
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        DetailPage.routeName: (context) => const DetailPage(),
      },
    ),
  );
}
