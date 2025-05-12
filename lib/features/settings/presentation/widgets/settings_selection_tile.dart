import 'package:drivers_test/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsSelectionTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SettingsSelectionTile({
    super.key,
    required this.title,
    required this.isSelected,
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
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          height: 48.0,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.headlineHeadline,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 16.0),
              isSelected
                  ? SvgPicture.asset(
                    AppIcons.correct,
                    width: 28.0,
                    height: 28.0,
                    fit: BoxFit.cover,
                  )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
