import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundColor;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.title,
    this.backgroundColor,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? AppColors.bgPrimary,
      centerTitle: true,
      actionsPadding: EdgeInsets.only(right: 12.0),
      leading: Padding(
        padding: EdgeInsets.only(left: 12.0),
        child: leading ?? CustomBackButton(),
      ),
      leadingWidth: 90.0,
      title:
          title == null
              ? null
              : Text(
                title!,
                textAlign: TextAlign.center,
                style: AppTextStyles.headlineHeadline,
              ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
