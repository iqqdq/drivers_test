import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TestResultScreen extends StatefulWidget {
  const TestResultScreen({super.key});

  @override
  State<TestResultScreen> createState() => _TestResultScreenState();
}

class _TestResultScreenState extends State<TestResultScreen> {
  late final TestResultChangeNotifier _read;

  @override
  void initState() {
    _read = context.read<TestResultChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<TestResultChangeNotifier>();
    final padding = EdgeInsets.all(16.0);

    return Scaffold(
      appBar: CustomAppBar(leading: CustomCloseButton(onTap: _onCloseTap)),
      body:
          watch.test.result == null && watch.bestTime == null
              ? LoadingIndicator(color: AppColors.black100)
              : Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: padding,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /// IMAGE
                            SvgPicture.asset(
                              watch.test.isPassed
                                  ? AppIcons.correct
                                  : AppIcons.incorrect,
                              height: 72.0,
                            ),
                            SizedBox(width: 16.0),

                            /// TITLE
                            Expanded(
                              child: Text(
                                watch.test.isPassed
                                    ? watch.test.isExam
                                        ? AppTitles.theExamWasSuccessfullyPassed
                                        : AppTitles.theTestWasSuccessfullyPassed
                                    : watch.test.isExam
                                    ? AppTitles.theExamWasNotPassed
                                    : AppTitles.theTestWasNotPassed,
                                style: AppTextStyles.headlineTitle2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.0),

                        /// YOUR RESULT
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
                              title:
                                  '${watch.test.result!.correctAnswerAmount}/${watch.test.questionIds.length}',
                              subtitle: AppTitles.correctAnswers,
                              image: AppImages.correctAnswers,
                            ),
                            ResultView(
                              title: '${watch.test.accuracy}%',
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
                            /// CURRENT TIME
                            ResultView(
                              title:
                                  Duration(
                                    seconds:
                                        watch.test.result!.durationInSeconds,
                                  ).toHmsString(),
                              subtitle: AppTitles.currentTime,
                              image: AppImages.currentTime,
                            ),

                            /// BEST TIME
                            ResultView(
                              title:
                                  watch.bestTime == null
                                      ? ''
                                      : Duration(
                                        seconds: watch.bestTime!,
                                      ).toHmsString(),
                              subtitle: AppTitles.bestTime,
                              image: AppImages.bestTime,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: padding.copyWith(
                      bottom: getBottomPadding(context),
                    ),
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
                          title:
                              watch.test.isExam
                                  ? AppTitles.takeTheExamAgain
                                  : AppTitles.takeTheTestAgain,
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

  void _onCloseTap() => router.replace(TestingRoutes.testCatalog);

  void _onReviewAnswersTap() => router.push(
    TestingRoutes.testPage,
    extra: TestScreenRouteArgs(
      test: _read.test,
      answers: _read.test.result!.answers,
    ),
  );

  void _onTakeTheTestAgainTap() => router.replace(
    TestingRoutes.testPage,
    extra: TestScreenRouteArgs(test: _read.test),
  );
}
