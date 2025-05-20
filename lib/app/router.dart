import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

const _splash = '/';
// const _onboard = '/onboard';
// const _paywall = '/paywall';
const _home = '/home';
const _testCatalog = '/test_catalog';
const _testPage = '/test_page/:test';
const _testResult = '/test_result';
const _statistics = '/statistics';
const _tips = '/tips';
const _reminders = '/reminders';
const _reminderPage = '/reminder_page';
const _settings = '/settings';
const _settingsSelection = '/settings_selection';

abstract class AppRoutes {
  static String get splash => _splash;
  // static String get onboard => _onboard;
  // static String get paywall => _paywall;
  static String get home => _home;
  static String get testCatalog => _testCatalog;
  static String get testPage => _testPage;
  static String get testResult => _testResult;
  static String get statistics => _statistics;
  static String get tips => _tips;
  static String get reminders => _reminders;
  static String get reminderPage => _reminderPage;
  static String get settings => _settings;
  static String get settingsSelection => _settingsSelection;
}

final router = GoRouter(
  routes: [
    GoRoute(path: _splash, builder: (context, state) => SplashScreen()),
    GoRoute(path: _home, builder: (context, state) => HomeScreen()),
    GoRoute(
      path: _testCatalog,
      builder: (context, state) => TestCatalogScreen(),
    ),
    GoRoute(
      path: _testPage,
      builder:
          (context, state) => ChangeNotifierProvider(
            create:
                (_) =>
                    TestPageChangeNotifier(test: state.extra as TestEntity)
                      ..getQuestions(),
            child: TestPageScreen(),
          ),
    ),
    GoRoute(path: _testResult, builder: (context, state) => TestResultScreen()),
    GoRoute(path: _statistics, builder: (context, state) => StatisticsScreen()),
    GoRoute(path: _tips, builder: (context, state) => TipsScreen()),
    GoRoute(path: _reminders, builder: (context, state) => RemindersScreen()),
    GoRoute(
      path: _reminderPage,
      builder:
          (context, state) => ChangeNotifierProvider(
            create: (_) => ReminderPageChangeNotifier(),
            child: const ReminderPageScreen(),
          ),
    ),
    GoRoute(path: _settings, builder: (context, state) => SettingsScreen()),
    GoRoute(
      path: _settingsSelection,
      builder: (context, state) => SettingsSelectionScreen(),
    ),
  ],
);
