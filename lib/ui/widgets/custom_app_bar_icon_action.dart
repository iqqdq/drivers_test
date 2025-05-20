import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBarIconAction extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;

  const CustomAppBarIconAction({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = 56.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        width: height,
        height: height,
        child: Center(child: SvgPicture.asset(icon)),
      ),
    );
  }
}
