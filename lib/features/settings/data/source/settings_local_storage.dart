import 'dart:convert';

import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/settings/domain/domain.dart';

class SettingsLocalStorage {
  final LocalStorage localStorage;
  static const _settingsKey = 'settings';

  SettingsLocalStorage({required this.localStorage});

  Future<SettingsEntity?> getSettings() async {
    final json = await localStorage.get(_settingsKey);
    return json == null ? null : SettingsEntity.fromJson(jsonDecode(json));
  }

  Future saveSettings(SettingsEntity settings) async =>
      await localStorage.save(_settingsKey, jsonEncode(settings));

  Future deleteSettings() async => localStorage.delete(_settingsKey);
}
