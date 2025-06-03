import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorListView extends StatelessWidget {
  final double examReadiness;
  final int totalPassedTest;
  final int totalTest;
  final int totalCorrectAnswers;
  final int totalQuestions;

  const ProgressIndicatorListView({
    super.key,
    required this.examReadiness,
    required this.totalPassedTest,
    required this.totalTest,
    required this.totalCorrectAnswers,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      padding: EdgeInsets.zero,
      separatorBuilder: (context, index) => SizedBox(height: 12.0),
      itemBuilder: (context, index) {
        final progress =
            index == 0
                ? examReadiness
                : index == 1
                ? (totalPassedTest == 0 || totalTest == 0
                    ? 0.0
                    : totalPassedTest / totalTest)
                : (totalCorrectAnswers == 0 || totalQuestions == 0
                    ? 0.0
                    : totalCorrectAnswers / totalQuestions);

        final title =
            index == 0
                ? AppTitles.examReadiness
                : index == 1
                ? AppTitles.passedPracticalTests
                : AppTitles.correctAnswers;
        final color =
            index == 0
                ? AppColors.yellow
                : index == 2
                ? AppColors.blue100
                : null;
        final value =
            index == 0
                ? examReadiness.toStringPercent()
                : index == 1
                ? '$totalPassedTest/$totalTest'
                : '$totalCorrectAnswers/$totalQuestions';

        return CustomProgressIndicator(
          progress: progress * (index == 0 ? 0.1 : 1.0),
          title: title,
          value: value,
          isValueHidden: !isSubscribed.value && (index == 1 || index == 2),
          color: color,
        );
      },
    );
  }
}
