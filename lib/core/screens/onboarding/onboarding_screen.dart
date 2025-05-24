import 'package:drivers_test/app/app.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/core/screens/onboarding/widgets/paywall_page.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  final bool isPaywall;

  const OnboardingScreen({super.key, this.isPaywall = false});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  late int _index;

  @override
  void initState() {
    _index = widget.isPaywall ? 3 : 0;
    _pageController = PageController(initialPage: _index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                /// PAGE VIEW
                PageView.builder(
                  physics:
                      widget.isPaywall
                          ? const NeverScrollableScrollPhysics()
                          : const ClampingScrollPhysics(),
                  controller: _pageController,
                  itemCount: 4,
                  onPageChanged: (value) => setState(() => _index = value),
                  itemBuilder: (context, index) {
                    final image =
                        index == 0
                            ? AppImages.onboarding1
                            : index == 1
                            ? AppImages.onboarding2
                            : index == 2
                            ? AppImages.onboarding3
                            : AppImages.paywall;
                    final title =
                        index == 0
                            ? AppTitles.prepareForTheTest
                            : index == 1
                            ? AppTitles.letUsKnowWhatDoYouThink
                            : index == 2
                            ? AppTitles.pickYourState
                            : AppTitles.unlockPremiumFeatures;
                    final subtitle =
                        index == 0
                            ? AppTitles.practiceWithTests
                            : index == 1
                            ? AppTitles.tellUsWhatYouThink
                            : index == 2
                            ? AppTitles.eachStateHasItsOwnRules
                            : AppTitles.unlimitedNumberOfTestsExamsAndStats;

                    return index == 3
                        ? PaywallPage(
                          image: image,
                          title: title,
                          subtitle: subtitle,
                          onChanged: (value) {},
                        )
                        : OnboardingPage(
                          image: image,
                          title: title,
                          subtitle: subtitle,
                        );
                  },
                ),

                SafeArea(
                  child: Stack(
                    children: [
                      // CLOSE BUTTON
                      _index == 3
                          ? Positioned(
                            left: 0.0,
                            child: CloseButton(
                              color: AppColors.black100,
                              onPressed: _onCloseTap,
                            ),
                          )
                          : SizedBox(),

                      /// STEP INDICATOR
                      widget.isPaywall
                          ? SizedBox.shrink()
                          : SizedBox(
                            height: 56.0,
                            child: Center(
                              child: StepIndicator(lenght: 4, index: _index),
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
              onTap: (index) => {},
            ),
          ),
        ],
      ),
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onContinueTap() {
    _index == 3
        ? {
          // TODO SUBSCRIBE
          router.go(AppRoutes.home),
        }
        : _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
  }

  void _onCloseTap() => router.go(AppRoutes.home);
}
