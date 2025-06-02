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
  String? _state;

  @override
  void initState() {
    _read = context.read<SettingsChangeNotifier>();
    _state = _read.settings?.state;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SettingsChangeNotifier>();
    final items = widget.isStateSelection ? states : licenses;

    return Scaffold(
      appBar: _state == null ? null : CustomAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ).copyWith(top: _state == null ? 24.0 : 0.0),
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
                            ? watch.settings?.state == items[index]
                            : watch.settings?.license == licenses[index],
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
    _state == null ? router.go(HomeRoutes.home) : router.pop();
  }
}
