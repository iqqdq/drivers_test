import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _splash = '/';
const _getPremium = '/get_premium';

abstract class AppRoutes {
  static String get splash => _splash;
  static String get getPremium => _getPremium;
}

final router = GoRouter(
  routes: [
    GoRoute(path: _splash, builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: _getPremium,
      builder: (context, state) => const GetPremiumScreen(),
    ),
    ...OnboardingRoutes.routes,
    ...PaywallRoutes.routes,
    ...TestingRoutes.routes,
    ...StatisticsRoutes.routes,
    ...RemindersRoutes.routes,
    ...SettingsRoutes.routes,
  ],
  observers: [_RouterLogger()],
);

class _RouterLogger extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      debugPrint('Route pushed: ${route.settings.name}');

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      debugPrint('Route popped: ${route.settings.name}');

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) =>
      debugPrint('Route replaced: ${newRoute?.settings.name}');
}
