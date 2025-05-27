import 'package:drivers_test/features/settings/domain/domain.dart';

abstract class SettingsRepository {
  Future<SettingsEntity?> getSettings();
  Future setSettings(SettingsEntity settings);
}
