import 'package:drivers_test/features/settings/data/data.dart';
import 'package:drivers_test/features/settings/domain/domain.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalStorage _localStorage;

  SettingsRepositoryImpl({required SettingsLocalStorage localStorage})
    : _localStorage = localStorage;

  @override
  Future<SettingsEntity?> getSettings() async =>
      await _localStorage.getSettings();

  @override
  Future saveSettings({required SettingsEntity settings}) async =>
      await _localStorage.saveSettings(settings);

  @override
  Future deleteSettings() async => _localStorage.deleteSettings();
}
