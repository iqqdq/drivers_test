import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TransparentButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(20.0);
    final Color color = AppColors.blue100;

    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          width: double.infinity,
          height: 56.0,
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: color),
            borderRadius: borderRadius,
          ),
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.buttonTitle.copyWith(color: color),
            ),
          ),
        ),
      ),
    );
  }
}
