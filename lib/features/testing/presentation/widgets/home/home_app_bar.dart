import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback onStateTap;
  final VoidCallback onNotificationsTap;
  final VoidCallback onSettingsTap;

  const HomeAppBar({
    super.key,
    this.title,
    required this.onStateTap,
    required this.onNotificationsTap,
    required this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      centerTitle: false,
      actionsPadding: EdgeInsets.only(right: 12.0),
      leadingWidth: 90.0,
      title: GestureDetector(
        onTap: onStateTap,
        child: Row(
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width / 2.0,
              ),
              child: Text(
                title ?? '',
                style: AppTextStyles.headlineTitle1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 4.0),
            SvgPicture.asset(AppIcons.arrowDown),
          ],
        ),
      ),
      actions: [
        CustomAppBarAction(
          icon: AppIcons.notifications,
          onTap: onNotificationsTap,
        ),
        CustomAppBarAction(icon: AppIcons.settings, onTap: onSettingsTap),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
