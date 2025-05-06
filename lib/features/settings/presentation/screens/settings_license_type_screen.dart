import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:drivers_test/features/features.dart';
import 'package:provider/provider.dart';

class SettingsLicenseTypeScreen extends StatefulWidget {
  const SettingsLicenseTypeScreen({super.key});

  @override
  State<SettingsLicenseTypeScreen> createState() =>
      _SettingsLicenseTypeScreenState();
}

class _SettingsLicenseTypeScreenState extends State<SettingsLicenseTypeScreen> {
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
      appBar: CustomAppBar(),
      backgroundColor: AppColors.bgPrimary,
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
                    AppTitles.selectLicenseType,
                    style: AppTextStyles.headlineTitle1,
                  ),
                  const SizedBox(height: 8.0),

                  /// SUBTITLE
                  Text(
                    AppTitles.settingLicenseTypeDescription,
                    style: AppTextStyles.textSubheadline.copyWith(
                      color: AppColors.black70,
                    ),
                  ),
                ],
              ),
            ),

            /// LIST VIEW
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                itemCount: licenseTypes.length,
                separatorBuilder:
                    (context, index) =>
                        Divider(color: AppColors.black10, height: 1.0),
                itemBuilder: (context, index) {
                  return SettingsSelectionTile(
                    title: licenseTypes[index],
                    isSelected: watch.licenseTypeIndex == index,
                    onTap: () => _onLicenseTypeTap(index),
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child:
              /// CONTINUE BUTTON
              PrimaryButton(
                title: AppTitles.continuee,
                onTap:
                    watch.licenseTypeIndex.isNegative
                        ? null
                        : () => _onContinuePressed(
                          licenseTypes[watch.licenseTypeIndex],
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // MARK: -
  // MARK: -

  void _onLicenseTypeTap(int index) => read.selectLicenseType(index);

  void _onContinuePressed(String licenseType) async {
    await read.saveLicenseType(licenseType);
    if (mounted) Navigator.pop(context);
  }
}
