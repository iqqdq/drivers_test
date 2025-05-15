import 'di_container.dart';
import 'package:drivers_test/core/database/database.dart';
// import 'package:drivers_test/features/splash/splash.dart';
import 'package:drivers_test/features/testing/testing.dart';
import 'package:drivers_test/features/settings/settings.dart';

final sl = DIContainer();

Future<void> initInjections() async {
  // External
  final db = AppDatabase();
  await db.customSelect('SELECT 1').get();

  // MARK: -
  // MARK: - SPLASH

  // Data sources
  // final splashLocalStorage = SplashLocalStorage(localStorage: localStorage);

  // Repositories
  // sl.registerLazySingleton<SplashRepository>(
  //   (container) => SplashRepositoryImpl(localStorage: splashLocalStorage),
  // );

  // MARK: -
  // MARK: - TESTING

  // Data sources
  final testingLocalDataSource = TestingLocalDataSource(db);

  // Repositories
  sl.registerLazySingleton<TestingRepository>(
    (container) => TestingRepositoryImpl(testingLocalDataSource),
  );

  // MARK: -
  // MARK: - SETTING'S

  // Data sources
  final settingsLocalDataSource = SettingsLocalDataSource(db);

  // Repositories
  sl.registerLazySingleton<SettingsRepository>(
    (container) => SettingsRepositoryImpl(settingsLocalDataSource),
  );
}
