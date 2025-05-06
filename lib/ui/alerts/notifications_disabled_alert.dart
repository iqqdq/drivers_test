import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PushNotificationsAlert {
  static void show(BuildContext context) => showAlertDialog(
    context: context,
    title: AppTitles.pushNotificationsDisabled,
    message: AppTitles.pleaseEnablePushNotifications,
    actions: [
      AlertDialogAction(
        key: 0,
        label: AppTitles.cancel,
        textStyle: TextStyle(color: AppColors.blue100),
      ),
      AlertDialogAction(
        key: 1,
        label: AppTitles.settings,
        textStyle: TextStyle(color: AppColors.blue100),
      ),
    ],
  ).then((value) async {
    if (value == 1) {
      await launchUrl(Uri.parse('app-settings:'));
    }
  });
}
