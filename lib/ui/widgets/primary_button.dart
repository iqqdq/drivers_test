import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const PrimaryButton({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(20.0);

    return Material(
      color: onTap == null ? AppColors.black10 : AppColors.blue100,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        splashColor: Colors.transparent,
        highlightColor: AppColors.blue50,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          width: double.infinity,
          height: 56.0,
          decoration: BoxDecoration(borderRadius: borderRadius),
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.buttonTitle.copyWith(
                color: onTap == null ? null : AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
