import 'package:flutter/material.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter_svg/svg.dart';

class SettingsTile extends StatelessWidget {
  final String icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: AppColors.black20,
        onTap: onTap,
        child: Container(
          height: 64.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              /// IMAGE
              SvgPicture.asset(icon),
              const SizedBox(width: 16.0),

              /// TITLE
              Expanded(
                flex: 2,
                child: Text(title, style: AppTextStyles.headlineHeadline),
              ),

              /// VALUE
              Expanded(
                child: Text(
                  value,
                  textAlign: TextAlign.end,
                  style: AppTextStyles.footnote.copyWith(
                    color: AppColors.black60,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 16.0),
              SvgPicture.asset(AppIcons.arrowRight),
            ],
          ),
        ),
      ),
    );
  }
}
