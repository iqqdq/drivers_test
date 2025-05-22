import 'package:drivers_test/app/app.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:drivers_test/features/features.dart';
import 'package:provider/provider.dart';

class SettingsSelectionScreen extends StatefulWidget {
  const SettingsSelectionScreen({super.key});

  @override
  State<SettingsSelectionScreen> createState() =>
      _SettingsSelectionScreenState();
}

class _SettingsSelectionScreenState extends State<SettingsSelectionScreen> {
  late final SettingsChangeNotifier _read;

  @override
  void initState() {
    _read = context.read<SettingsChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SettingsChangeNotifier>();
    final items = watch.settingsMode == SettingsMode.state ? states : licenses;

    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Text(
                    watch.settingsMode == SettingsMode.state
                        ? AppTitles.selectYourState
                        : AppTitles.selectLicenseType,
                    style: AppTextStyles.headlineTitle1,
                  ),
                  const SizedBox(height: 8.0),

                  /// SUBTITLE
                  Text(
                    watch.settingsMode == SettingsMode.state
                        ? AppTitles.settingStateDescription
                        : AppTitles.settingLicenseDescription,
                    style: AppTextStyles.textSubheadline.copyWith(
                      color: AppColors.black70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16.0),

            /// LIST VIEW
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 16.0),
                itemCount: items.length,
                separatorBuilder:
                    (context, index) =>
                        Divider(color: AppColors.black10, height: 1.0),
                itemBuilder: (context, index) {
                  return SettingsSelectionTile(
                    title: items[index].toStateName(),
                    isSelected:
                        watch.settingsMode == SettingsMode.state
                            ? watch.settings?.state == items[index]
                            : watch.settings?.license == licenses[index],
                    onTap:
                        () =>
                            watch.settingsMode == SettingsMode.state
                                ? _onStateTap(items[index])
                                : _onLicenseTap(items[index]),
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ).copyWith(top: 8.0),
              child:
              /// CONTINUE BUTTON
              PrimaryButton(
                title: AppTitles.continuee,
                onTap:
                    watch.settingsMode == SettingsMode.state
                        ? watch.settings?.state == null
                            ? null
                            : () => _onContinueTap()
                        : watch.settings?.license == null
                        ? null
                        : () => _onContinueTap(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // MARK: -
  // MARK: -

  void _onStateTap(String state) => _read.selectState(state);

  void _onLicenseTap(String license) => _read.selectLicense(license);

  void _onContinueTap() async {
    await _read.saveSettings();
    if (mounted) router.pop();
  }
}
