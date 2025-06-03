import 'package:drivers_test/features/features.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

const _onboarding = '/onboarding';

abstract class OnboardingRoutes {
  static String get onboarding => _onboarding;

  static final List<GoRoute> routes = [
    GoRoute(
      path: _onboarding,
      builder: (context, state) {
        return ChangeNotifierProvider<OnboardingChangeNotifier>(
          create: (_) => OnboardingChangeNotifier(),
          child: const OnboardingScreen(),
        );
      },
    ),
  ];
}
