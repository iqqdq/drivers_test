import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBarAction extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;

  const CustomAppBarAction({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = 56.0;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: height,
        height: height,
        child: Center(child: SvgPicture.asset(icon)),
      ),
    );
  }
}
