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
      backgroundColor: AppColors.bgPrimary,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(width: 1.0, color: AppColors.black10),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ClipRRect(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: watch.titles.length,
            separatorBuilder:
                (context, index) => Divider(
                  color: AppColors.black10,
                  indent: 72.0,
                  height: 1.0,
                ),
            itemBuilder: (context, index) {
              return index == 0
                  ? ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    child: SettingsSwitchTile(
                      icon: watch.icons[index],
                      title: watch.titles[index],
                      value:
                          watch.settings?.isPushNotificationsEnabled ?? false,
                      onChanged: _onSwitchTap,
                    ),
                  )
                  : ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        index == watch.titles.length - 1 ? 16.0 : 0.0,
                      ),
                      bottomRight: Radius.circular(
                        index == watch.titles.length - 1 ? 16.0 : 0.0,
                      ),
                    ),
                    child: SettingsTile(
                      icon: watch.icons[index],
                      title: watch.titles[index],
                      value:
                          index == 1
                              ? watch.settings?.state ?? ''
                              : index == 2
                              ? watch.settings?.license ?? ''
                              : '',
                      onTap: () => _onSettingTap(index),
                    ),
                  );
            },
          ),
        ),
      ),
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

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
