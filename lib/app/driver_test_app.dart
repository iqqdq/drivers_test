import 'package:drivers_test/app/app.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:drivers_test/features/testing/presentation/providers/test_list_change_notifier.dart';
import 'package:drivers_test/ui/theme/app_theme.dart';
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
        ChangeNotifierProvider<TestListChangeNotifier>(
          create: (_) => TestListChangeNotifier()..getTests(category: null),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.appTheme,
        initialRoute: AppNavigation.initialRoute,
        routes: AppNavigation.routes,
      ),
    );
  }
}
