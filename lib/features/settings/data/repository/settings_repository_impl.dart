import 'package:drivers_test/features/settings/data/data.dart';
import 'package:drivers_test/features/settings/domain/domain.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;

  SettingsRepositoryImpl(this.localDataSource);

  @override
  Future<SettingsEntity?> getSettings() async {
    try {
      final settings = await localDataSource.getSettings();
      return settings;
    } catch (e) {
      throw Exception('Failed to get settings');
    }
  }

  @override
  Future updateSettings(SettingsEntity settings) async {
    try {
      await localDataSource.setSettings(settings);
    } catch (e) {
      throw Exception('Failed to set settings');
    }
  }
}
