import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/foundation.dart';
import 'package:in_app_review/in_app_review.dart';

class OnboardingChangeNotifier with ChangeNotifier {
  int _page = 0;
  int get page => _page;

  void changePage(int page) async {
    _page = page;
    notifyListeners();

    if (_page == 2) {
      final InAppReview inAppReview = InAppReview.instance;

      if (await inAppReview.isAvailable()) {
        await inAppReview.requestReview();
      }
    } else if (_page == 2) {
      final settings = SettingsEntity(isOnboardingComplete: true);
      await sl.get<SettingsRepository>().setSettings(settings);
    }
  }
}
