import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:go_router/go_router.dart';

const _splash = '/';

abstract class AppRoutes {
  static String get splash => _splash;
}

final router = GoRouter(
  routes: [
    GoRoute(path: _splash, builder: (context, state) => const SplashScreen()),
    ...OnboardingRoutes.routes,
    ...HomeRoutes.routes,
    ...TestingRoutes.routes,
    ...StatisticsRoutes.routes,
    ...RemindersRoutes.routes,
    ...SettingsRoutes.routes,
  ],
);
