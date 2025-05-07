import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final int percent;
  final VoidCallback onTap;

  const StatsCard({super.key, required this.percent, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(38.0);

    return Material(
      color: AppColors.green100,
      borderRadius: borderRadius,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: AppColors.green50,
        borderRadius: borderRadius,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          height: 141.0,
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
                  /// PERCENT
                  Text(
                    '$percent%',
                    style: AppTextStyles.headlineLargeTitle.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Spacer(),

                  /// QUESTION'S
                  Text(
                    AppTitles.examReadiness,
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
