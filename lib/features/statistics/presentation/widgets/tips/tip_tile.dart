import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

class TipTile extends StatelessWidget {
  final String title;
  final String description;

  const TipTile({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.headlineTitle2),
        const SizedBox(height: 8.0),
        Text(
          description,
          style: AppTextStyles.textBody.copyWith(color: AppColors.black70),
        ),
      ],
    );
  }
}
