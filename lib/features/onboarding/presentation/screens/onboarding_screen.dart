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
  late final OnboardingChangeNotifier _read;
  late PageController _pageController;

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
                  physics:
                      _pageController.initialPage == 3
                          ? const NeverScrollableScrollPhysics()
                          : const ClampingScrollPhysics(),
                  controller: _pageController,
                  itemCount: _read.images.length,
                  onPageChanged: (value) => _read.changePage(value),
                  itemBuilder: (context, index) {
                    return index == 3
                        ? PaywallPage(
                          image: _read.images[index],
                          title: _read.titles[index],
                          subtitle: _read.subtitles[index],
                          onChanged: _onSwitchChanged,
                        )
                        : OnboardingPage(
                          image: _read.images[index],
                          title: _read.titles[index],
                          subtitle: _read.subtitles[index],
                        );
                  },
                ),

                SafeArea(
                  child: Stack(
                    children: [
                      // CLOSE BUTTON
                      watch.page == 3
                          ? Row(
                            children: [
                              CloseButton(
                                color: AppColors.black100,
                                onPressed: _onCloseTap,
                              ),
                            ],
                          )
                          : SizedBox(),

                      /// STEP INDICATOR
                      _pageController.initialPage == 3
                          ? SizedBox.shrink()
                          : SizedBox(
                            height: 56.0,
                            child: Center(
                              child: StepIndicator(
                                lenght: 4,
                                index: watch.page,
                              ),
                            ),
                          ),
                    ],
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
            child: OnboardingFooterView(
              titles: [
                AppTitles.termsOfUse,
                AppTitles.restore,
                AppTitles.privacyPolicy,
              ],
              onTap: _onFooterButtonTap,
            ),
          ),
        ],
      ),
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onCloseTap() async {
    final state = (await sl.get<SettingsRepository>().getSettings())?.state;
    state == null
        ? router.go(SettingsRoutes.settingsSelection, extra: true)
        : router.canPop()
        ? router.pop()
        : router.go(HomeRoutes.home);
  }

  void _onSwitchChanged(bool value) => _read.toogleTrialPeriod(value);

  void _onContinueTap() async {
    if (_pageController.page! == 3) {
      final error = await sl.get<PurchaseService>().purchase(
        priceProductService: _read.isTrial ? weekTrialProduct : weekProduct,
      );
      if (mounted) {
        error == null && isSubscribed.value
            ? router.go(HomeRoutes.home)
            : showOkAlertDialog(
              context: context,
              title: AppTitles.warning,
              message: error,
            );
      }
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onFooterButtonTap(int index) async {
    if (index == 0 || index == 2) {
      _read.openWebView(index);
    } else {
      final error = await sl.get<PurchaseService>().restore();
      if (mounted) {
        error == null
            ? router.go(HomeRoutes.home)
            : showAlertDialog(
              context: context,
              title: AppTitles.warning,
              message: error,
            ).whenComplete(() {});
      }
    }
  }
}
