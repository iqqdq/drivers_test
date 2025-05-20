import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnswerTile extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool? isCorrect;
  final VoidCallback? onTap;

  const AnswerTile({
    super.key,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20.0);

    Color? color;
    String? icon;

    if (isCorrect != null) {
      if (isSelected) {
        color = isCorrect! ? AppColors.green100 : AppColors.orange100;
        icon = isCorrect! ? AppIcons.correct : AppIcons.incorrect;
      } else if (isCorrect!) {
        color = AppColors.green100;
        icon = AppIcons.correct;
      }
    }

    return Material(
      color: color == null ? AppColors.card : color.withValues(alpha: 0.1),
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(width: 1.0, color: color ?? AppColors.border),
          ),
          child: Row(
            children: [
              /// CHECKBOX
              icon == null
                  ? Container(
                    width: 24.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: AppColors.blue30),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  )
                  : SvgPicture.asset(icon),

              const SizedBox(width: 12.0),

              /// TEXT
              Expanded(
                child: Text(
                  text,
                  style: AppTextStyles.subheadlineRegular.copyWith(
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
