import 'package:drift/drift.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/settings/domain/domain.dart';

class SettingsLocalDataSource {
  final AppDatabase _db;

  SettingsLocalDataSource(this._db);

  Future<SettingsEntity?> getSettings() async {
    final settings = await _db.select(_db.settingsTable).getSingleOrNull();
    return settings;
  }

  Future setSettings(SettingsEntity settings) async => await _db
      .into(_db.settingsTable)
      .insertOnConflictUpdate(
        SettingsTableCompanion.insert(
          id: const Value(0),
          isPushEnabled: Value(settings.isPushEnabled),
          state: Value(settings.state),
          license: Value(settings.license),
        ),
      );
}
