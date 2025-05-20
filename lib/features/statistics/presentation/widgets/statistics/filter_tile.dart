import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class FilterTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  const FilterTile({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20.0);

    return Material(
      color: AppColors.card,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(
              width: 1.0,
              color: isSelected ? AppColors.blue100 : AppColors.border,
            ),
          ),
          child: Row(
            children: [
              /// CHECKBOX
              CustomCheckbox(isSelected: isSelected),
              const SizedBox(width: 12.0),

              /// TITLE
              Expanded(
                child: Text(title, style: AppTextStyles.subheadlineRegular),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
