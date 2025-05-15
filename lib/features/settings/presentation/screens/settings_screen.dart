import 'package:drivers_test/app/app.dart';
import 'package:drivers_test/ui/alerts/alerts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:drivers_test/ui/ui.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
  late final SettingsChangeNotifier read;

  @override
  void initState() {
    read = context.read<SettingsChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SettingsChangeNotifier>();

    return Scaffold(
      appBar: CustomAppBar(title: AppTitles.settings),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ).copyWith(top: 16.0),
                child: GetFullAccessCard(onTap: _onGetFullAccessPressed),
              ),

              /// SETTING'S LIST VIEW
              Container(
                margin: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(width: 1.0, color: AppColors.black10),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: titles.length,
                    separatorBuilder:
                        (context, index) => Divider(
                          color: AppColors.black10,
                          indent: 72.0,
                          height: 1.0,
                        ),
                    itemBuilder: (context, index) {
                      return index == 0
                          ? SettingsSwitchTile(
                            icon: icons[index],
                            title: titles[index],
                            value: watch.settings?.isPushEnabled ?? false,
                            onChanged: _onSwitchTap,
                          )
                          : SettingsTile(
                            icon: icons[index],
                            title: titles[index],
                            value:
                                index == 1
                                    ? watch.settings?.state ?? ''
                                    : index == 2
                                    ? watch.settings?.license ?? ''
                                    : '',
                            onTap: () => _onSettingTap(index),
                          );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onGetFullAccessPressed() {
    // TODO SHOW PAYWALL
  }

  void _onSwitchTap(bool value) async =>
      await read.togglePushNotifications(value).then((isEnabled) {
        if (!isEnabled && mounted) PushNotificationsAlert.show(context);
      });

  void _onSettingTap(int index) {
    if (index == 1 || index == 2) {
      read.setSettingsMode(
        index == 1 ? SettingsMode.state : SettingsMode.license,
      );
      Navigator.pushNamed(context, AppRoutes.settingsSelection);
    } else {
      read.openSettings(index);
    }
  }
}
