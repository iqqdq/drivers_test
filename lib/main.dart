import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;

final notificationService = NotificationService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Notification's
  tz.initializeTimeZones();
  await notificationService.init();
  await notificationService.requestNotificationPermission();

  // Injection's
  await initInjections();

  runApp(const App());
}
