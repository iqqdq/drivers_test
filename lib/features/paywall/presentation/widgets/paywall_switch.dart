import 'package:drivers_test/core/core.dart';
import 'package:flutter/cupertino.dart';

class PaywallSwitch extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;

  const PaywallSwitch({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20.0);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.5),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border.all(width: 1.0, color: AppColors.border),
        borderRadius: borderRadius,
      ),
      child: Row(
        children: [
          /// TITLE
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.headlineHeadline,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 12.0),

          /// SWITCH
          CupertinoSwitch(
            value: value,
            activeTrackColor: AppColors.blue100,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
