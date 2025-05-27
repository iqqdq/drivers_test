import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

class TestTile extends StatelessWidget {
  final int index;
  final TestEntity test;
  final VoidCallback onTap;

  const TestTile({
    super.key,
    required this.index,
    required this.test,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20.0);
    final accuracyColor =
        test.accuracy == null
            ? AppColors.black100
            : test.isPassed
            ? AppColors.green100
            : AppColors.orange100;

    return Material(
      color: AppColors.card,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          height: 76.0,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(width: 1.0, color: AppColors.border),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  /// NUMBER
                  test.isExam ? const ExamView() : NumberView(index: index),
                  const SizedBox(width: 12.0),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// TITLE
                        Text(test.name, style: AppTextStyles.headlineHeadline),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            /// ACCURACY
                            test.accuracy == null
                                ? SizedBox.shrink()
                                : Text(
                                  '${AppTitles.testAccuracy} ${test.accuracy}%',
                                  style: AppTextStyles.caption.copyWith(
                                    color: accuracyColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Text(
                    '${test.result?.correctAnswerAmount ?? 0}/${test.questionIds.length}',
                    style: AppTextStyles.subheadlineRegular.copyWith(
                      color: accuracyColor,
                    ),
                    overflow: TextOverflow.ellipsis,
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
