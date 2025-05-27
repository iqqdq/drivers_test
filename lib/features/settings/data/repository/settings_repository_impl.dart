import 'package:drift/drift.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/settings/domain/domain.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Future<SettingsEntity?> getSettings() async {
    try {
      final settings = await _db.select(_db.settings).getSingleOrNull();
      return settings;
    } catch (e) {
      return null;
    }
  }

  @override
  Future setSettings(SettingsEntity settings) async {
    final current = await getSettings();
    await _db
        .into(_db.settings)
        .insertOnConflictUpdate(
          SettingsCompanion.insert(
            id: const Value(0),
            isPushEnabled: Value(
              settings.isPushEnabled ?? current?.isPushEnabled,
            ),
            state: Value(settings.state ?? current?.state),
            license: Value(settings.license ?? current?.license),
            isOnboardingComplete: Value(settings.isOnboardingComplete),
          ),
        );
  }
}
