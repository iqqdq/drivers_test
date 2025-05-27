import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExamView extends StatelessWidget {
  const ExamView({super.key});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(12.0);
    final color = AppColors.violet;

    return Container(
      width: 44.0,
      height: 44.0,
      decoration: BoxDecoration(color: color, borderRadius: borderRadius),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 22.0,
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(22.0),
                  ),
                ),
              ),
            ),
            Center(child: SvgPicture.asset(AppIcons.exam)),
          ],
        ),
      ),
    );
  }
}
