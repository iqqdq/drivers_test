import 'package:drivers_test/core/ui/theme/app_colors.dart';
import 'package:drivers_test/core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class TagTile extends StatelessWidget {
  final String title;

  const TagTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(32.0);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(width: 1.0, color: AppColors.border),
        borderRadius: borderRadius,
      ),
      child: Text(title, style: AppTextStyles.footnote),
    );
  }
}
