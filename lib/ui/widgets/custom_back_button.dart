import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/ui/ui.dart';

class CustomBackButton extends StatefulWidget {
  const CustomBackButton({super.key});

  @override
  State<CustomBackButton> createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Row(
        children: [
          SvgPicture.asset(AppIcons.backArrow),
          const SizedBox(width: 4.0),
          Text(
            AppTitles.back,
            style: AppTextStyles.textBody.copyWith(color: AppColors.blue100),
          ),
        ],
      ),
    );
  }
}
