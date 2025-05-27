import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

class CustomAppBarAction extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const CustomAppBarAction({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = 56.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        width: height,
        height: height,
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.textBody.copyWith(
              color: onTap == null ? AppColors.blue50 : AppColors.blue100,
            ),
          ),
        ),
      ),
    );
  }
}
