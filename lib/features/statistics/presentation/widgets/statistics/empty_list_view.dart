import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyListView extends StatelessWidget {
  final String icon;
  final String title;

  const EmptyListView({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(icon),
        SizedBox(height: 12.0),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.headlineHeadline,
        ),
      ],
    );
  }
}
