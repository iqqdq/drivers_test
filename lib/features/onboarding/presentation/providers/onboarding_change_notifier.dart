import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/foundation.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboardingChangeNotifier with ChangeNotifier {
  final images = [
    AppImages.onboarding1,
    AppImages.onboarding2,
    AppImages.onboarding3,
    AppImages.paywall,
  ];

  final titles = [
    AppTitles.prepareForTheTest,
    AppTitles.letUsKnowWhatDoYouThink,
    AppTitles.pickYourState,
    AppTitles.unlockPremiumFeatures,
  ];

  final subtitles = [
    AppTitles.practiceWithTests,
    AppTitles.tellUsWhatYouThink,
    AppTitles.eachStateHasItsOwnRules,
    AppTitles.unlimitedNumberOfTestsExamsAndStats,
  ];

  final InAppReview _inAppReview = InAppReview.instance;

  int _page = 0;
  int get page => _page;

  bool _isTrial = false;
  bool get isTrial => _isTrial;

  Future _setOnboardingComplete() async {
    final settings = SettingsEntity(isOnboardingComplete: true);
    await sl.get<SettingsRepository>().setSettings(settings);
  }

  void changePage(int page) async {
    _page = page;
    notifyListeners();

    if (_page == 2 && await _inAppReview.isAvailable()) {
      await _inAppReview.requestReview();
    } else if (_page == 3) {
      await _setOnboardingComplete();
    }
  }

  void toogleTrialPeriod(bool value) => _isTrial = value;

  void openWebView(int index) => launchUrl(
    Uri.parse(index == 0 ? AppConstants.termsOfUse : AppConstants.privacyUrl),
  );
}
