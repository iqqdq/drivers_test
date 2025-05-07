import 'di_container.dart';
import 'package:drivers_test/core/storage/storage.dart';
import 'package:drivers_test/features/splash/splash.dart';
import 'package:drivers_test/features/settings/settings.dart';

final sl = DIContainer();

Future<void> initInjections() async {
  // External
  final localStorage = await LocalStorage.create();
  sl.registerLazySingleton((container) => localStorage);

  // Data sources
  sl.registerLazySingleton(
    (container) => SplashLocalStorage(localStorage: localStorage),
  );

  sl.registerLazySingleton(
    (container) => SettingsLocalStorage(localStorage: localStorage),
  );

  // Repositories
  sl.registerLazySingleton<SplashRepository>(
    (container) => SplashRepositoryImpl(
      localStorage: SplashLocalStorage(localStorage: localStorage),
    ),
  );

  sl.registerLazySingleton<SettingsRepository>(
    (container) => SettingsRepositoryImpl(
      localStorage: SettingsLocalStorage(localStorage: localStorage),
    ),
  );
}
