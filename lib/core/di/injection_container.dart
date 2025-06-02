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
  sl.registerLazySingleton((_) => PurchaseService());
  sl.registerLazySingleton((_) => NotificationService());

  // MARK: -
  // MARK: - REPOSITORIE'S
  sl.registerLazySingleton<HomeRepository>((_) => HomeRepositoryImpl(db));
  sl.registerLazySingleton<TestingRepository>((_) => TestingRepositoryImpl(db));
  sl.registerLazySingleton<StatisticsRepository>(
    (_) => StatisticsRepositoryImpl(db),
  );
  sl.registerLazySingleton<RemindersRepository>(
    (_) => RemindersRepositoryImpl(db),
  );
  sl.registerLazySingleton<SettingsRepository>(
    (_) => SettingsRepositoryImpl(db),
  );
}
