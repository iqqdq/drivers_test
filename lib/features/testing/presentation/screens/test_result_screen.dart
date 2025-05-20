import 'package:drivers_test/app/router.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TestResultScreen extends StatefulWidget {
  const TestResultScreen({super.key});

  @override
  State<TestResultScreen> createState() => _TestResultScreenState();
}

class _TestResultScreenState extends State<TestResultScreen> {
  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.all(16.0);

    return Scaffold(
      appBar: CustomAppBar(leading: CustomCloseButton(onTap: _onCloseTap)),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: padding,
              children: [
                /// TITLE
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.correct, height: 72.0),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Text(
                        AppTitles
                            .theTestWasSuccessfullyPassed, // TODO IF PASSED OR EXAM OR EXAM PASSED
                        style: AppTextStyles.headlineTitle2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.0),

                /// RESULT
                Text(
                  AppTitles.yourResult,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.black70,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ResultView(
                      title: 'null/null',
                      subtitle: AppTitles.correctAnswers,
                      image: AppImages.correctAnswers,
                    ),
                    ResultView(
                      title: 'null%',
                      subtitle: AppTitles.passingScore,
                      image: AppImages.passingScore,
                    ),
                  ],
                ),
                SizedBox(height: 24.0),

                /// SPENT TIME
                Text(
                  AppTitles.spentTime,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.black70,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ResultView(
                      title: 'null',
                      subtitle: AppTitles.currentTime,
                      image: AppImages.currentTime,
                    ),
                    ResultView(
                      title: 'null',
                      subtitle: AppTitles.bestTime,
                      image: AppImages.bestTime,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: padding.copyWith(bottom: getBottomPadding(context) + 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /// REVIEW ANSWER'S BUTTON
                PrimaryButton(
                  title: AppTitles.reviewAnswers,
                  onTap: _onReviewAnswersTap,
                ),
                const SizedBox(height: 8.0),

                /// TAKE THE TEST AGAIN BUTTON
                TransparentButton(
                  title: AppTitles.takeTheTestAgain,
                  onTap: _onTakeTheTestAgainTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onCloseTap() => router.replace('/test_catalog');

  void _onReviewAnswersTap() => router.pop();

  void _onTakeTheTestAgainTap() => {};
}
