import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:go_router/go_router.dart';

const _splash = '/';
const _subscriptions = '/subscriptions';

abstract class AppRoutes {
  static String get splash => _splash;
  static String get subscriptions => _subscriptions;
}

final router = GoRouter(
  routes: [
    GoRoute(path: _splash, builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: _subscriptions,
      builder: (context, state) => const SubscriptionsScreen(),
    ),
    ...OnboardingRoutes.routes,
    ...HomeRoutes.routes,
    ...TestingRoutes.routes,
    ...StatisticsRoutes.routes,
    ...RemindersRoutes.routes,
    ...SettingsRoutes.routes,
  ],
);
