import 'package:drivers_test/app/app.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DriverTestApp extends StatefulWidget {
  const DriverTestApp({super.key});

  @override
  State<DriverTestApp> createState() => _AppState();
}

class _AppState extends State<DriverTestApp> {
  @override
  void dispose() {
    sl.get<AppDatabase>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsChangeNotifier>(
          create: (_) => SettingsChangeNotifier()..getSettings(),
        ),
        ChangeNotifierProvider<ReminderssChangeNotifier>(
          create: (_) => ReminderssChangeNotifier(),
        ),
        ChangeNotifierProvider<TestListChangeNotifier>(
          create: (_) => TestListChangeNotifier(),
        ),
      ],
      child: MaterialApp.router(theme: AppTheme.appTheme, routerConfig: router),
    );
  }
}
