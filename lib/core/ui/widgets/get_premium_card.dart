import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

class GetPremiumCard extends StatelessWidget {
  final String subtitle;
  final String secondSubtitle;
  final VoidCallback onTap;

  const GetPremiumCard({
    super.key,
    required this.subtitle,
    required this.secondSubtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16.0);
    final height = 139.0;

    return Material(
      color: AppColors.violet,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: SizedBox(
          height: 94.0,
          child: Stack(
            children: [
              /// CLIP OVAL
              ClipRRect(
                borderRadius: borderRadius,
                child: OverflowBox(
                  maxHeight: height,
                  maxWidth: height,
                  child: Transform.translate(
                    offset: Offset(height / 0.7, 0.0),
                    child: ClipOval(
                      child: Container(
                        width: 139.0,
                        height: 139.0,
                        color: AppColors.white.withValues(alpha: 0.32),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// TITLE
                    Text(
                      AppTitles.getPremium,
                      style: AppTextStyles.headlineHeadline.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 4.0),

                    /// SUBTITLE
                    Text(
                      subtitle,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 4.0),

                    /// SECOND SUBTITLE
                    Text(
                      secondSubtitle,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
