import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

class SubsctiptionTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SubsctiptionTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 13.0),
          child: Text(
            title,
            style: AppTextStyles.headlineHeadline.copyWith(
              color: AppColors.black100,
            ),
          ),
        ),
      ),
    );
  }
}
