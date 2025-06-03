import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';
import 'package:drivers_test/features/features.dart';
import 'package:provider/provider.dart';

class SettingSelectionScreen extends StatefulWidget {
  final bool isStateSelection;

  const SettingSelectionScreen({super.key, required this.isStateSelection});

  @override
  State<SettingSelectionScreen> createState() => _SettingSelectionScreenState();
}

class _SettingSelectionScreenState extends State<SettingSelectionScreen> {
  late final SettingsChangeNotifier _read;

  @override
  void initState() {
    _read = context.read<SettingsChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SettingsChangeNotifier>();
    final items = widget.isStateSelection ? states : licenses;

    return Scaffold(
      appBar:
          widget.isStateSelection && _read.settings?.state == null
              ? null
              : CustomAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0).copyWith(
                top:
                    widget.isStateSelection && _read.settings?.state == null
                        ? 24.0
                        : 0.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Text(
                    widget.isStateSelection
                        ? AppTitles.selectYourState
                        : AppTitles.selectLicenseType,
                    style: AppTextStyles.headlineTitle1,
                  ),
                  const SizedBox(height: 8.0),

                  /// SUBTITLE
                  Text(
                    widget.isStateSelection
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
                        const Divider(color: AppColors.black10, height: 1.0),
                itemBuilder: (context, index) {
                  return SettingsSelectionTile(
                    title: items[index].toStateName(),
                    isSelected:
                        widget.isStateSelection
                            ? watch.state == items[index]
                            : watch.license == licenses[index],
                    onTap:
                        () =>
                            widget.isStateSelection
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
                    widget.isStateSelection
                        ? watch.state == null
                            ? null
                            : () => _onContinueTap()
                        : watch.license == null
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
  // MARK: - FUNCTION'S

  void _onStateTap(String state) => _read.selectState(state);

  void _onLicenseTap(String license) => _read.selectLicense(license);

  void _onContinueTap() async {
    if (widget.isStateSelection && !router.canPop()) {
      router.push(
        SettingsRoutes.settingsSelection,
        extra: !widget.isStateSelection,
      );
    } else if (_read.settings?.state == null) {
      await _read.saveSettings();
      router.go(TestingRoutes.home);
    } else {
      await _read.saveSettings();
      router.pop();
    }
  }
}
