import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const ResultView({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final width = ((MediaQuery.of(context).size.width / 2.0) - 3.5) - 16.0;
    final padding = EdgeInsets.symmetric(horizontal: 16.0);
    final borderRadius = BorderRadius.circular(32.0);

    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: borderRadius,
        border: Border.all(width: 1.0, color: AppColors.border),
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: padding.copyWith(top: 16.0),
              child: Text(title, maxLines: 1, style: AppTextStyles.title1Bold),
            ),
            Padding(
              padding: padding,
              child: Text(
                subtitle,
                maxLines: 1,
                style: AppTextStyles.caption.copyWith(color: AppColors.black70),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Image.asset(image)],
            ),
          ],
        ),
      ),
    );
  }
}
