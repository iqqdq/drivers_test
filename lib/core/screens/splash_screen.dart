import 'package:drivers_test/app/routes.dart';
import 'package:drivers_test/ui/theme/theme.dart';
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
      body: Container(
        color: AppColors.blue100,
        child: Center(
          child: Image.asset(
            AppImages.appIcon,
            width: height,
            height: height,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _defineRoute() async {
    final bool isOnboardingCompleted =
        false; // TODO CHECK IS ONBOARDING COMPLETED

    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        isOnboardingCompleted
            ? AppRoutes.home
            : AppRoutes.home, // TODO CHANGE ROUTE TO ONBOARDING
        (Route<dynamic> route) => false,
      );
    }
  }
}
