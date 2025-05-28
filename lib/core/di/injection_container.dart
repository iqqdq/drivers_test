import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';

final sl = DIContainer();

Future<void> initInjections() async {
  // MARK: -
  // MARK: - EXTERNAL
  final db = await AppDatabase.create();
  await db.customSelect('SELECT 1').get();

  // MARK: -
  // MARK: -SERVICE'S
  sl.registerLazySingleton((container) => NotificationService());

  // MARK: -
  // MARK: - REPOSITORIE'S
  sl.registerLazySingleton<HomeRepository>(
    (container) => HomeRepositoryImpl(db),
  );
  sl.registerLazySingleton<TestingRepository>(
    (container) => TestingRepositoryImpl(db),
  );
  sl.registerLazySingleton<StatisticsRepository>(
    (container) => StatisticsRepositoryImpl(db),
  );
  sl.registerLazySingleton<RemindersRepository>(
    (container) => RemindersRepositoryImpl(db),
  );
  sl.registerLazySingleton<SettingsRepository>(
    (container) => SettingsRepositoryImpl(db),
  );
}
