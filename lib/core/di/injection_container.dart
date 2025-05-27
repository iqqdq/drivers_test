import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';

final sl = DIContainer();

Future<void> initInjections() async {
  // External
  final db = await AppDatabase.create();
  await db.customSelect('SELECT 1').get();

  // Repositories
  // sl.registerLazySingleton<SplashRepository>(
  //   (container) => SplashRepositoryImpl(localStorage: splashLocalStorage),
  // );
  sl.registerLazySingleton<HomeRepository>(
    (container) => HomeRepositoryImpl(db),
  );
  sl.registerLazySingleton<TestingRepository>(
    (container) => TestingRepositoryImpl(db),
  );
  sl.registerLazySingleton<StatisticsRepository>(
    (container) => StatisticsRepositoryImpl(db),
  );
  sl.registerLazySingleton<SettingsRepository>(
    (container) => SettingsRepositoryImpl(db),
  );
}
