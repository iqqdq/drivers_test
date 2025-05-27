import 'package:drivers_test/main.dart';
import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';

class SettingsChangeNotifier with ChangeNotifier {
  SettingsEntity? _settings;
  SettingsEntity? get settings => _settings;

  Future getSettings() async {
    _settings =
        await sl.get<SettingsRepository>().getSettings() ?? SettingsEntity();
    _settings?.isPushEnabled ??=
        await notificationService.checkNotificationPermission();
    notifyListeners();
  }

  Future saveSettings() async {
    await sl.get<SettingsRepository>().setSettings(_settings!);
    notifyListeners();
  }

  Future<bool> togglePushNotifications(bool value) async {
    if (!await notificationService.checkNotificationPermission()) return false;
    _settings?.isPushEnabled = value;
    await saveSettings();
    return true;
  }

  void openWebView(int index) => launchUrl(
    Uri.parse(
      index == 3
          ? AppConstants.termsOfUse
          : index == 4
          ? AppConstants.privacyUrl
          : AppConstants.supportUrl,
    ),
  );

  void share() => SharePlus.instance.share(
    ShareParams(uri: Uri.parse(AppConstants.shareUrl)),
  );

  void selectState(String state) {
    _settings?.state = state;
    notifyListeners();
  }

  void selectLicense(String type) {
    _settings?.license = type;
    notifyListeners();
  }
}
