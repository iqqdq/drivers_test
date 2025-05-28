import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Injection's
  await initInjections();

  // Notification's
  await sl.get<NotificationService>().init();

  runApp(const App());
}
