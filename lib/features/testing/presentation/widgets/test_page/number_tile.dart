import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

class NumberTile extends StatelessWidget {
  final String number;
  final bool isSelected;
  final bool isExam;
  final int correct;
  final int? answer;
  final VoidCallback onTap;

  const NumberTile({
    super.key,
    required this.number,
    required this.isSelected,
    required this.isExam,
    required this.correct,
    this.answer,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = 40.0;
    final color = AppColors.card;
    final borderRadius = BorderRadius.circular(12.0);

    final isCorrect = answer == null ? null : answer == correct;

    return Column(
      children: [
        /// NUMBER TILE
        GestureDetector(
          child: Material(
            color:
                isExam && answer != null
                    ? AppColors.blue100
                    : isCorrect == null
                    ? color
                    : isCorrect
                    ? AppColors.green100
                    : AppColors.orange100,
            borderRadius: borderRadius,
            child: InkWell(
              borderRadius: borderRadius,
              splashColor: Colors.transparent,
              onTap: onTap,
              child: Container(
                width: width,
                height: width,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  border:
                      isCorrect == null
                          ? Border.all(width: 1.0, color: AppColors.border)
                          : null,
                ),
                child: Center(
                  child: Text(
                    number,
                    style: AppTextStyles.footnote.copyWith(
                      color: isCorrect == null ? null : AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Spacer(),

        /// UNDERLINE
        Container(
          width: width,
          height: 2.0,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.blue100 : color,
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
      ],
    );
  }
}
