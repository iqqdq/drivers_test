import 'package:drivers_test/features/splash/data/data.dart';
import 'package:drivers_test/features/splash/domain/domain.dart';

class SplashRepositoryImpl implements SplashRepository {
  final SplashLocalStorage localStorage;

  SplashRepositoryImpl({required this.localStorage});

  @override
  Future<bool> isOnboardingCompleted() async =>
      await localStorage.isOnboardingCompleted() ?? false;
}
