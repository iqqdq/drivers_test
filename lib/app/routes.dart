import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _splash = '/';
// const _onboard = '/onboard';
// const _paywall = '/paywall';
const _home = '/home';
const _testList = '/test_list';
const _testPage = '/test_page';
const _settings = '/settings';
const _testResult = '/test_result';
// const _statistics = '/statistics';
const _settingsSelection = '/settings_selection';

abstract class AppRoutes {
  static String get splash => _splash;
  // static String get onboard => _onboard;
  // static String get paywall => _paywall;
  static String get home => _home;
  static String get testList => _testList;
  static String get testPage => _testPage;
  static String get testResult => _testResult;
  // static String get statistics => _statistics;
  static String get settings => _settings;
  static String get settingsSelection => _settingsSelection;
}

abstract class AppNavigation {
  static final initialRoute = AppRoutes.splash;

  static final routes = <String, Widget Function(BuildContext)>{
    _splash: (_) => const SplashScreen(),
    // _onboard: (_) => const OnboardScreen(),
    // _paywall: (_) => const PaywallScreen(isMonth: true),
    _home: (_) => const HomeScreen(),
    _testList: (_) => const TestListScreen(),
    _testPage:
        (_) => ChangeNotifierProvider(
          create: (_) => TestPageChangeNotifier(),
          child: const TestPageScreen(),
        ),
    _testResult: (_) => const TestResultScreen(),
    // _statistics: (_) => const StatisticsScreen(),
    _settings: (_) => SettingsScreen(),
    _settingsSelection: (_) => const SettingsSelectionScreen(),
  };
}
