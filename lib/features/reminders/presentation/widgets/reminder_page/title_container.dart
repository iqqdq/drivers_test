import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class TitleContainer extends StatelessWidget {
  final String title;
  final double? spacing;
  final Widget child;

  const TitleContainer({
    super.key,
    required this.title,
    this.spacing = 16.0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border.all(width: 1.0, color: AppColors.border),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.headlineHeadline),
          const SizedBox(height: 16.0),
          Divider(height: 1.0, color: AppColors.border),
          SizedBox(height: spacing),
          child,
        ],
      ),
    );
  }
}
