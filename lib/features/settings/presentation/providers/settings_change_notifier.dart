import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/settings/domain/domain.dart';

enum SettingsMode { state, license }

class SettingsChangeNotifier with ChangeNotifier {
  SettingsMode _settingsMode = SettingsMode.state;
  SettingsMode get settingsMode => _settingsMode;

  SettingsEntity? _settings;
  SettingsEntity? get settings => _settings;

  void getSettings() async {
    _settings =
        await sl.get<SettingsRepository>().getSettings() ?? SettingsEntity();
    // Set push notification's enabled on settings screen first appereance
    if (_settings?.isPushEnabled == null) {
      // togglePushNotifications(); TODO SET isPushNotificationsEnabled IF USER ALLOWED PUSH NOTIFICATIONS
    }
    notifyListeners();
  }

  Future saveSettings() async {
    if (_settings == null) return;
    await sl.get<SettingsRepository>().updateSettings(_settings!);
  }

  void setSettingsMode(SettingsMode settingsMode) =>
      _settingsMode = settingsMode;

  Future selectState(String state) async {
    _settings?.state = state;
    notifyListeners();
  }

  Future selectLicense(String type) async {
    _settings?.license = type;
    notifyListeners();
  }

  Future<bool> togglePushNotifications(bool value) async {
    // TODO PUSH PERMISSION LOGIC
    if (await Permission.notification.status.isDenied) return false;
    _settings?.isPushEnabled = value;

    await saveSettings();
    notifyListeners();

    return true;
  }

  void openSettings(int index) {
    switch (index) {
      case 3:
        launchUrl(Uri.parse(AppConstants.termsOfUse));
        break;
      case 4:
        launchUrl(Uri.parse(AppConstants.privacyUrl));
        break;
      case 5:
        launchUrl(Uri.parse(AppConstants.supportUrl));
        break;
      case 6:
        SharePlus.instance.share(
          ShareParams(uri: Uri.parse(AppConstants.shareUrl)),
        );
        break;
      default:
        break;
    }
  }
}
