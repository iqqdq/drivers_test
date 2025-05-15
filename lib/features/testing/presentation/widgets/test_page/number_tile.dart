import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class NumberTile extends StatelessWidget {
  final String number;
  final bool isSelected;
  final bool? isCorrect;
  final VoidCallback onTap;

  const NumberTile({
    super.key,
    required this.number,
    required this.isSelected,
    this.isCorrect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = 40.0;
    final color = AppColors.card;
    final borderRadius = BorderRadius.circular(12.0);

    return Column(
      children: [
        /// NUMBER TILE
        SizedBox(
          width: 44.0,
          child: Row(
            children: [
              GestureDetector(
                child: Material(
                  color:
                      isCorrect == null
                          ? color
                          : isCorrect!
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
                                ? Border.all(
                                  width: 1.0,
                                  color: AppColors.border,
                                )
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

              SizedBox(width: 4.0),
            ],
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
