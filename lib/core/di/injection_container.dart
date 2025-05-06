import 'package:drivers_test/core/storage/storage.dart';
import 'package:drivers_test/features/settings/data/repository/repository.dart';
import 'package:drivers_test/features/settings/data/repository/settings_repository_impl.dart';
import 'package:drivers_test/features/settings/data/source/source.dart';
import 'package:drivers_test/features/settings/domain/domain.dart';

import 'di_container.dart';

final sl = DIContainer();

Future<void> initInjections() async {
  // External
  final localStorage = await LocalStorage.create();
  sl.registerLazySingleton((container) => localStorage);

  // Data sources
  sl.registerLazySingleton(
    (container) => SettingsLocalStorage(localStorage: localStorage),
  );

  // Repositories
  sl.registerLazySingleton<SettingsRepository>(
    (container) => SettingsRepositoryImpl(
      localStorage: SettingsLocalStorage(localStorage: localStorage),
    ),
  );
}
