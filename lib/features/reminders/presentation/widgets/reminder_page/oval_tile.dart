import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class OvalTile extends StatelessWidget {
  final double height;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const OvalTile({
    super.key,
    required this.height,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(height / 2.0);

    return Material(
      color: isSelected ? AppColors.blue100 : AppColors.white,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          width: height,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border:
                isSelected
                    ? null
                    : Border.all(width: 1.0, color: AppColors.border),
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.textSubheadline.copyWith(
                color: isSelected ? AppColors.white : AppColors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
