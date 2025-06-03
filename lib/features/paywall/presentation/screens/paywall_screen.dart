import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  late final PaywallChangeNotifier _read;

  @override
  void initState() {
    _read = context.read<PaywallChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<PaywallChangeNotifier>();

    final price =
        watch.type == PaywallType.week
            ? weekProduct.getPriceAndDuration(omitOneUnit: true)
            : watch.type == PaywallType.weektrial
            ? weekTrialProduct.getPriceAndDurationPlus()
            : '${lifeTimeProduct.getOnlyCurrencySign()}${lifeTimeProduct.getOnlyPrice()}/${AppTitles.lifetime}';

    final description =
        '${AppTitles.unlimitedNumberOfTestsExamsAndStats} $price';

    final trailPeriod = weekTrialProduct.getTrialPeriod();

    final switchTitle =
        watch.type == PaywallType.week
            ? '${AppTitles.enable} $trailPeriod ${AppTitles.freeTrial}'
            : '$trailPeriod ${AppTitles.freeTrial} ${AppTitles.enabled}';

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Column(
              children: [
                // IMAGE
                Expanded(
                  child: Image.asset(AppImages.paywall, fit: BoxFit.fitWidth),
                ),

                /// TITLE
                Text(
                  AppTitles.unlockPremiumFeatures,
                  style: AppTextStyles.headlineTitle1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),

                /// DESCRIPTION
                Text(
                  description,
                  style: AppTextStyles.subheadlineRegular,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),

                /// SWITCH
                watch.type == PaywallType.lifetime
                    ? const SizedBox(height: 8.0)
                    : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: PaywallSwitch(
                        title: switchTitle,
                        value: watch.type == PaywallType.weektrial,
                        onChanged: _onSwitchTap,
                      ),
                    ),
                const SizedBox(height: 8.0),

                /// CONTINUE BUTTON
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: PrimaryButton(
                    title: AppTitles.continuee,
                    onTap: _onContinueTap,
                  ),
                ),

                /// TERM'S OF USE / RESTORE / PRIVACY POLICY BUTTON'S
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: RestoreFooterView(onTap: _onRestoreTap),
                ),
              ],
            ),

            // CLOSE BUTTON
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: CloseButton(
                  color: AppColors.black100,
                  onPressed: _onCloseTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // MARK: -
  // MARK: - FUNCTIONS

  void _onCloseTap() async {
    final state = (await sl.get<SettingsRepository>().getSettings())?.state;
    state == null
        ? router.pushReplacement(SettingsRoutes.settingsSelection, extra: true)
        : router.canPop()
        ? router.pop()
        : router.pushReplacement(TestingRoutes.home);
  }

  void _onSwitchTap(bool value) =>
      _read.changeType(type: value ? PaywallType.weektrial : PaywallType.week);

  void _onContinueTap() async {
    final priceProductService =
        _read.type == PaywallType.weektrial
            ? weekTrialProduct
            : _read.type == PaywallType.week
            ? weekProduct
            : lifeTimeProduct;

    final error = await sl.get<PurchaseService>().purchase(
      priceProductService: priceProductService,
    );

    _defineNextScreen(error);
  }

  void _onRestoreTap() async {
    final error = await sl.get<PurchaseService>().restore();
    _defineNextScreen(error);
  }

  void _defineNextScreen(String? error) async {
    if (mounted) {
      if (error == null) {
        // Обновляем статистику
        Provider.of<StatisticsChangeNotifier>(
          context,
          listen: false,
        ).getStatistics();
        // Переходим в следующее окно
        final state = (await sl.get<SettingsRepository>().getSettings())?.state;
        state == null
            ? router.pushReplacement(
              SettingsRoutes.settingsSelection,
              extra: true,
            )
            : router.pushReplacement(TestingRoutes.home);
      } else {
        showAlertDialog(
          context: context,
          title: AppTitles.warning,
          message: error,
          actions: [
            AlertDialogAction(
              key: 0,
              label: AppTitles.ok,
              textStyle: TextStyle(color: AppColors.blue100),
            ),
          ],
        ).whenComplete(() {});
      }
    }
  }
}
