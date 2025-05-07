import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:drivers_test/features/features.dart';
import 'package:provider/provider.dart';

class SettingsStateScreen extends StatefulWidget {
  const SettingsStateScreen({super.key});

  @override
  State<SettingsStateScreen> createState() => _SettingsStateScreenState();
}

class _SettingsStateScreenState extends State<SettingsStateScreen> {
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
                    AppTitles.selectYourState,
                    style: AppTextStyles.headlineTitle1,
                  ),
                  const SizedBox(height: 8.0),

                  /// SUBTITLE
                  Text(
                    AppTitles.settingStateDescription,
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
                itemCount: usaStates.length,
                separatorBuilder:
                    (context, index) =>
                        Divider(color: AppColors.black10, height: 1.0),
                itemBuilder: (context, index) {
                  return SettingsSelectionTile(
                    title: usaStates[index],
                    isSelected: watch.settings?.state == usaStates[index],
                    onTap: () => _onStateTap(index),
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
                    watch.settings?.state == null
                        ? null
                        : () => _onContinuePressed(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // MARK: -
  // MARK: -

  void _onStateTap(int index) => read.selectState(usaStates[index]);

  void _onContinuePressed() async {
    await read.saveSettings();
    if (mounted) Navigator.pop(context);
  }
}
