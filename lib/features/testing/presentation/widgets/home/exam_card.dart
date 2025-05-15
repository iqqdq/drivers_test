import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class ExamCard extends StatelessWidget {
  final int questions;
  final int passing;
  final int correct;
  final int minutes;
  final VoidCallback onTap;

  const ExamCard({
    super.key,
    required this.questions,
    required this.passing,
    required this.correct,
    required this.minutes,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(38.0);

    return Material(
      color: AppColors.orange100,
      borderRadius: borderRadius,
      child: InkWell(
        splashColor: Colors.transparent,
        borderRadius: borderRadius,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          height: 201.0,
          decoration: BoxDecoration(borderRadius: borderRadius),
          child: Stack(
            children: [
              /// IMAGE
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // TODO SET IMAGE
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Text(
                    AppTitles.exam,
                    style: AppTextStyles.headlineLargeTitle.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Spacer(),

                  /// QUESTION'S
                  Text(
                    '$questions ${AppTitles.questions}',
                    style: AppTextStyles.subheadlineRegular.copyWith(
                      color: AppColors.white,
                    ),
                  ),

                  /// PASSING SCORE
                  Text(
                    '$passing ${AppTitles.passingScore.toLowerCase()}',
                    style: AppTextStyles.subheadlineRegular.copyWith(
                      color: AppColors.white,
                    ),
                  ),

                  /// CORRECT ANSWER'S
                  Text(
                    '$correct ${AppTitles.correctAnswersToPass}',
                    style: AppTextStyles.subheadlineRegular.copyWith(
                      color: AppColors.white,
                    ),
                  ),

                  /// MINUTE'S TO COMPLETE TEST'S
                  Text(
                    '$minutes ${AppTitles.minutesToCompleteTest}',
                    style: AppTextStyles.subheadlineRegular.copyWith(
                      color: AppColors.white,
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
