import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/settings/domain/domain.dart';

class SettingsLocalStorage {
  final LocalStorage localStorage;
  static const _settingsKey = 'settings';

  SettingsLocalStorage({required this.localStorage});

  Future<SettingsEntity?> getSettings() async {
    final json = await localStorage.get<Map<String, dynamic>>(_settingsKey);
    return json == null ? null : SettingsEntity.fromJson(json);
  }

  Future saveSettings(SettingsEntity settings) async => await localStorage
      .save<Map<String, dynamic>>(_settingsKey, settings.toJson());

  Future deleteSettings() async => localStorage.delete(_settingsKey);
}
