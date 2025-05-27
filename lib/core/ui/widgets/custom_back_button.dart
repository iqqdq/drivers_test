import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:drivers_test/core/core.dart';

class CustomBackButton extends StatelessWidget {
  final Color? color;
  final VoidCallback onTap;

  const CustomBackButton({super.key, this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            SvgPicture.asset(
              AppIcons.arrowBack,
              colorFilter:
                  color == null
                      ? null
                      : ColorFilter.mode(color!, BlendMode.srcIn),
            ),
            const SizedBox(width: 4.0),
            Text(
              AppTitles.back,
              style: AppTextStyles.textBody.copyWith(
                color: color ?? AppColors.blue100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
