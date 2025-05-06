import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:drivers_test/ui/ui.dart';
import 'package:flutter_svg/svg.dart';

class SettingsSwitchTile extends StatelessWidget {
  final String icon;
  final String title;
  final bool value;
  final Function(bool) onChanged;

  const SettingsSwitchTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: AppColors.black20,
        onTap: () => onChanged(!value),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              /// IMAGE
              SvgPicture.asset(icon),
              const SizedBox(width: 16.0),

              /// TITLE
              Expanded(
                child: Text(title, style: AppTextStyles.headlineHeadline),
              ),
              const SizedBox(width: 16.0),

              /// SWITCH
              CupertinoSwitch(
                value: value,
                activeTrackColor: AppColors.blue100,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
