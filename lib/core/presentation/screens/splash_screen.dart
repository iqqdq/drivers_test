import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _defineRoute());
  }

  @override
  Widget build(BuildContext context) {
    final height = 163.0;

    return Scaffold(
      backgroundColor: AppColors.blue100,
      body: Center(
        child: Image.asset(
          AppImages.appIcon,
          width: height,
          height: height,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _defineRoute() async {
    if (mounted) {
      if (isSubscribed.value) {
        router.pushReplacement(TestingRoutes.home);
      } else {
        final settings = await sl.get<SettingsRepository>().getSettings();
        final bool isOnboardingCompleted =
            settings?.isOnboardingComplete ?? false;

        if (isOnboardingCompleted) {
          isSubscribed.value
              ? router.pushReplacement(TestingRoutes.home)
              : router.pushReplacement(
                PaywallRoutes.paywall,
                extra: PaywallType.week,
              );
        } else {
          router.pushReplacement(OnboardingRoutes.onboarding);
        }
      }
    }
  }
}
