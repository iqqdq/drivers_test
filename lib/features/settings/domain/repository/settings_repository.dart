import 'package:drivers_test/features/settings/domain/domain.dart';

abstract interface class SettingsRepository {
  Future<SettingsEntity?> getSettings();
  Future saveSettings({required SettingsEntity settings});
  Future deleteSettings();
}
