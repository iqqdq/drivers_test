import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isSelected;

  const CustomCheckbox({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.white : null,
        border: Border.all(
          width: isSelected ? 6.0 : 1.0,
          color: isSelected ? AppColors.blue100 : AppColors.blue30,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
