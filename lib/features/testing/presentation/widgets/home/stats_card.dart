import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final double percent;
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
        borderRadius: borderRadius,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0).copyWith(top: 16.0),
          decoration: BoxDecoration(borderRadius: borderRadius),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 32.0,
                  ).copyWith(top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// PERCENT
                      Text(
                        percent.toStringPercent(),
                        style: AppTextStyles.headlineLargeTitle.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      /// QUESTION'S
                      Text(
                        AppTitles.examReadiness,
                        style: AppTextStyles.subheadlineRegular.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// IMAGE
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Image.asset(AppImages.cardStats, height: 120.0)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
