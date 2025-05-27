import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? titleColor;
  final Color? backgroundColor;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleColor,
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
        child: leading ?? CustomBackButton(onTap: () => router.pop()),
      ),
      leadingWidth: 90.0,
      title: Text(
        title ?? '',
        textAlign: TextAlign.center,
        style: AppTextStyles.headlineHeadline.copyWith(color: titleColor),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
