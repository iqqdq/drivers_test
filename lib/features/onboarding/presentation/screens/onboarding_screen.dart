import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const _images = [
    AppImages.onboarding1,
    AppImages.onboarding2,
    AppImages.onboarding3,
  ];

  static const _titles = [
    AppTitles.prepareForTheTest,
    AppTitles.letUsKnowWhatDoYouThink,
    AppTitles.pickYourState,
  ];

  static const _subtitles = [
    AppTitles.practiceWithTests,
    AppTitles.tellUsWhatYouThink,
    AppTitles.eachStateHasItsOwnRules,
  ];

  late final OnboardingChangeNotifier _read;
  late final PageController _pageController;

  @override
  void initState() {
    _read = context.read<OnboardingChangeNotifier>();
    _pageController = PageController(initialPage: _read.page);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<OnboardingChangeNotifier>();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                /// PAGE VIEW
                PageView.builder(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  itemCount: _images.length,
                  onPageChanged: (value) => _read.changePage(value),
                  itemBuilder: (context, index) {
                    return OnboardingPage(
                      image: _images[index],
                      title: _titles[index],
                      subtitle: _subtitles[index],
                    );
                  },
                ),

                /// STEP INDICATOR
                SafeArea(
                  child: SizedBox(
                    height: 56.0,
                    child: Center(
                      child: StepIndicator(
                        lenght: _images.length,
                        index: watch.page,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

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
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
            ).copyWith(top: 4.0, bottom: getBottomPadding(context) * 0.6),
            child: RestoreFooterView(onTap: _onRestoreTap),
          ),
        ],
      ),
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onContinueTap() async {
    if (_pageController.page! == 2) {
      await _setOnboardingComplete();
      router.pushReplacement(PaywallRoutes.paywall, extra: PaywallType.week);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onRestoreTap() async {
    final error = await sl.get<PurchaseService>().restore();
    if (mounted) {
      if (error == null) {
        await _setOnboardingComplete();
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

  Future _setOnboardingComplete() async {
    final settings = SettingsEntity(isOnboardingComplete: true);
    await sl.get<SettingsRepository>().setSettings(settings);
  }
}
