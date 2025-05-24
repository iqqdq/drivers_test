import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

const _splash = '/';
const _onboarding = '/onboarding';
// const _paywall = '/paywall';
const _home = '/home';
const _statistics = '/statistics';
const _tips = '/tips';
const _reminders = '/reminders';
const _reminderPage = '/reminder_page';
const _settings = '/settings';
const _settingsSelection = '/settings_selection';

abstract class AppRoutes {
  static String get splash => _splash;
  static String get onboarding => _onboarding;
  // static String get onboard => _onboard;
  // static String get paywall => _paywall;
  static String get home => _home;
  static String get statistics => _statistics;
  static String get tips => _tips;
  static String get reminders => _reminders;
  static String get reminderPage => _reminderPage;
  static String get settings => _settings;
  static String get settingsSelection => _settingsSelection;
}

final router = GoRouter(
  routes: [
    GoRoute(path: _splash, builder: (context, state) => const SplashScreen()),
    GoRoute(path: _onboarding, builder: (context, state) => OnboardingScreen()),

    GoRoute(path: _home, builder: (context, state) => const HomeScreen()),

    ...TestRoutes.routes,

    GoRoute(
      path: _statistics,
      builder:
          (context, state) => ChangeNotifierProvider(
            create: (_) => StatisticsChangeNotifier()..getResults(),
            child: const StatisticsScreen(),
          ),
    ),
    GoRoute(path: _tips, builder: (context, state) => const TipsScreen()),
    GoRoute(
      path: _reminders,
      builder: (context, state) => const RemindersScreen(),
    ),
    GoRoute(
      path: _reminderPage,
      builder:
          (context, state) => ChangeNotifierProvider(
            create: (_) => ReminderPageChangeNotifier(),
            child: const ReminderPageScreen(),
          ),
    ),
    GoRoute(
      path: _settings,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: _settingsSelection,
      builder: (context, state) => const SettingsSelectionScreen(),
    ),
  ],
);
