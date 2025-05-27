import 'package:flutter/material.dart';
import 'package:drivers_test/core/core.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // IMAGE
        Expanded(child: Image.asset(image, fit: BoxFit.fitWidth)),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            /// TITLE
            Text(
              title,
              style: AppTextStyles.headlineTitle1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),

            /// SUBTITLE
            Text(
              subtitle,
              style: AppTextStyles.subheadlineRegular.copyWith(
                color: AppColors.black100,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),
          ],
        ),
      ],
    );
  }
}
