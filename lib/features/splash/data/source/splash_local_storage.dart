import 'package:drivers_test/core/core.dart';

class SplashLocalStorage {
  final LocalStorage localStorage;

  SplashLocalStorage({required this.localStorage});

  Future<bool?> isOnboardingCompleted() async =>
      await localStorage.get<bool>('is_onboarding_completed');
}
