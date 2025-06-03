import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';

class SettingsChangeNotifier with ChangeNotifier {
  SettingsEntity? _settings;
  SettingsEntity? get settings => _settings;

  String? _state;
  String? get state => _state;

  String? _license;
  String? get license => _license;

  Future getSettings() async {
    _settings =
        await sl.get<SettingsRepository>().getSettings() ?? SettingsEntity();
    _settings?.isPushEnabled ??=
        await sl.get<NotificationService>().checkNotificationPermission();

    _state = _settings?.state;
    _license = _settings?.license;

    notifyListeners();
  }

  Future saveSettings() async {
    _settings = _settings!.copyWith(state: _state, license: _license);
    await sl.get<SettingsRepository>().setSettings(_settings!);
    notifyListeners();
  }

  Future<bool> togglePushNotifications(bool value) async {
    final isGranted =
        await sl.get<NotificationService>().checkNotificationPermission();

    if (isGranted) {
      _settings?.isPushEnabled = value;
      await saveSettings();
    }

    return isGranted;
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
    _state = state;
    notifyListeners();
  }

  void selectLicense(String license) {
    _license = license;
    notifyListeners();
  }
}
