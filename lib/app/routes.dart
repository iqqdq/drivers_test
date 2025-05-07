import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';

const _splash = '/';
const _onboard = '/onboard';
const _paywall = '/paywall';
const _home = '/home';
const _practice = '/practice';

const _settings = '/settings';
const _settingsState = '/settings_state';
const _settingsLicenseType = '/settings_license_type';

abstract class AppRoutes {
  static String get splash => _splash;
  static String get onboard => _onboard;
  static String get paywall => _paywall;
  static String get home => _home;
  static String get practice => _practice;

  static String get settings => _settings;
  static String get settingsState => _settingsState;
  static String get settingsLicenseType => _settingsLicenseType;
}

abstract class AppNavigation {
  static final initialRoute = AppRoutes.splash;

  static final routes = <String, Widget Function(BuildContext)>{
    _splash: (_) => const SplashScreen(),
    // _onboard: (_) => const OnboardScreen(),
    // _paywall: (_) => const PaywallScreen(isMonth: true),
    _home: (_) => const HomeScreen(),
    _practice: (_) => const PracticeScreen(),

    _settings: (_) => SettingsScreen(),
    _settingsState: (_) => const SettingsStateScreen(),
    _settingsLicenseType: (_) => const SettingsLicenseTypeScreen(),
  };
}
