import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class NumberView extends StatelessWidget {
  final int index;

  const NumberView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(12.0);
    final color = AppColors.tests[index % AppColors.tests.length];
    final clipOvals = [
      // 1. Top
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 22.0,
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.5),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(22.0)),
          ),
        ),
      ),

      // 2. Right
      Positioned(
        top: 0,
        right: 0,
        bottom: 0,
        child: Container(
          width: 22.0,
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.5),
            borderRadius: BorderRadius.horizontal(left: Radius.circular(22.0)),
          ),
        ),
      ),

      // 3. Bottom
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 22.0,
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.5),
            borderRadius: BorderRadius.vertical(top: Radius.circular(22.0)),
          ),
        ),
      ),

      // 4. Left
      Positioned(
        top: 0,
        left: 0,
        bottom: 0,
        child: Container(
          width: 22.0,
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.5),
            borderRadius: BorderRadius.horizontal(right: Radius.circular(22.0)),
          ),
        ),
      ),
    ];

    return Container(
      width: 44.0,
      height: 44.0,
      decoration: BoxDecoration(color: color, borderRadius: borderRadius),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          children: [
            clipOvals[index % clipOvals.length],
            Center(
              child: Text(
                '${index + 1}',
                style: AppTextStyles.headlineTitle3.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
