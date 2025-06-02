import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

class TestsCard extends StatelessWidget {
  final int passed;
  final int total;
  final VoidCallback onTap;

  const TestsCard({
    super.key,
    required this.passed,
    required this.total,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(38.0);

    return Material(
      color: AppColors.blue100,
      borderRadius: borderRadius,
      child: InkWell(
        splashColor: Colors.transparent,
        borderRadius: borderRadius,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6.0).copyWith(bottom: 32.0),
          height: 300.0,
          decoration: BoxDecoration(borderRadius: borderRadius),
          child: Column(
            children: [
              // IMAGE
              Image.asset(AppImages.cardPracticalTests, height: 140.0),
              const SizedBox(height: 30.0),
              Column(
                children: [
                  /// TITLE
                  Text(
                    AppTitles.practicalTests,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.headlineLargeTitle.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  /// PASSED / TOTAL TEST
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 9.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.0),
                      color: AppColors.blue10,
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$passed',
                            style: AppTextStyles.headlineHeadline,
                          ),
                          TextSpan(
                            text: '/$total ${AppTitles.testPassed}',
                            style: AppTextStyles.textSubheadline.copyWith(
                              color: AppColors.black90,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
