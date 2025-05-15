import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterTile({
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
        splashColor: Colors.transparent,
        borderRadius: borderRadius,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10.0).copyWith(left: 16.0),
          height: 40.0,
          decoration: BoxDecoration(
            border:
                isSelected
                    ? null
                    : Border.all(width: 1.0, color: AppColors.border),
            borderRadius: borderRadius,
          ),
          child: Row(
            children: [
              /// TITLE
              Text(
                title,
                style: AppTextStyles.textSubheadline.copyWith(
                  color: isSelected ? AppColors.white : null,
                ),
              ),

              /// BUTTON
              SvgPicture.asset(
                isSelected ? AppIcons.clear : AppIcons.arrowDown,
                colorFilter:
                    isSelected
                        ? ColorFilter.mode(AppColors.white, BlendMode.srcIn)
                        : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
