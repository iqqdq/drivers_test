import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/settings/domain/domain.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsChangeNotifier with ChangeNotifier {
  final icons = [
    AppIcons.settingsNotifications,
    AppIcons.settingsState,
    AppIcons.settingsLicenseType,
    AppIcons.settingsTermsOfUse,
    AppIcons.settingsPrivacyPolicy,
    AppIcons.settingsSupport,
    AppIcons.settingsShareApp,
  ];

  final titles = [
    AppTitles.pushNotification,
    AppTitles.selectYourState,
    AppTitles.selectLicenseType,
    AppTitles.termsOfUse,
    AppTitles.privacyPolicy,
    AppTitles.support,
    AppTitles.shareApp,
  ];

  SettingsEntity? _settings;
  SettingsEntity? get settings => _settings;

  int _stateIndex = -1;
  int get stateIndex => _stateIndex;

  int _licenseTypeIndex = -1;
  int get licenseTypeIndex => _licenseTypeIndex;

  SettingsChangeNotifier() {
    _init();
  }

  _init() async {
    _settings =
        (await sl.get<SettingsRepository>().getSettings()) ?? SettingsEntity();
    notifyListeners();
  }

  _saveSettings(SettingsEntity? settings) async {
    if (settings == null) return;
    await sl.get<SettingsRepository>().saveSettings(settings: settings);
  }

  void selectState(int index) {
    _stateIndex = index;
    notifyListeners();
  }

  void selectLicenseType(int index) {
    _licenseTypeIndex = index;
    notifyListeners();
  }

  Future<bool> togglePushNotifications(bool value) async {
    if (await Permission.notification.status.isDenied) return false;

    _settings?.isPushNotificationsEnabled = value;
    await _saveSettings(_settings);
    notifyListeners();

    return true;
  }

  Future saveState(String state) async {
    _settings?.state = state;
    await _saveSettings(_settings);
    notifyListeners();
  }

  Future saveLicenseType(String type) async {
    _settings?.licenseType = type;
    await _saveSettings(_settings);
    notifyListeners();
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
