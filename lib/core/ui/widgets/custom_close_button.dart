import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:drivers_test/core/core.dart';

class CustomCloseButton extends StatelessWidget {
  final VoidCallback onTap;

  const CustomCloseButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            SvgPicture.asset(AppIcons.close),
            const SizedBox(width: 4.0),
            Text(
              AppTitles.close,
              style: AppTextStyles.textBody.copyWith(color: AppColors.blue100),
            ),
          ],
        ),
      ),
    );
  }
}
