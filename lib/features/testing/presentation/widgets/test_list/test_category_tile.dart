import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class TestCategoryTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const TestCategoryTile({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(32.0);

    return Material(
      color: isSelected ? AppColors.blue100 : AppColors.card,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        splashColor: Colors.transparent,
        onTap: isSelected ? null : onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(width: 1.0, color: AppColors.border),
          ),
          child: Text(
            title,
            style: AppTextStyles.subheadlineRegular.copyWith(
              color: isSelected ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
