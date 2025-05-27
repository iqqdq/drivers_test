import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TimerAppBarAction extends StatelessWidget {
  final Duration duration;

  const TimerAppBarAction({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.timer),
        const SizedBox(width: 4.0),
        Container(
          constraints: BoxConstraints(
            minWidth: duration.inHours == 0 ? 50.0 : 62.0,
          ),
          child: Text(
            duration.toHmsString(),
            style: AppTextStyles.textBody.copyWith(color: AppColors.blue100),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
