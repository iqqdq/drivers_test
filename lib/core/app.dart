import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void dispose() {
    sl.get<AppDatabase>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RemindersChangeNotifier>(
          create: (_) => RemindersChangeNotifier()..getReminders(),
        ),
        ChangeNotifierProvider<SettingsChangeNotifier>(
          create: (_) => SettingsChangeNotifier()..getSettings(),
        ),
        ChangeNotifierProvider<StatisticsChangeNotifier>(
          create: (_) => StatisticsChangeNotifier()..getStatistics(),
        ),
      ],
      child: MaterialApp.router(theme: AppTheme.appTheme, routerConfig: router),
    );
  }
}
