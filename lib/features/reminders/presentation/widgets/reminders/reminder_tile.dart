import 'package:drivers_test/features/features.dart';
import 'package:drivers_test/core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReminderTile extends StatelessWidget {
  final String title;
  final List<String>? tags;
  final bool value;
  final VoidCallback onTap;
  final Function(bool) onChanged;

  const ReminderTile({
    super.key,
    required this.title,
    this.tags,
    required this.value,
    required this.onTap,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20.0);

    return Material(
      color: AppColors.card,
      borderRadius: borderRadius,
      child: InkWell(
        splashColor: Colors.transparent,
        borderRadius: borderRadius,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ).copyWith(top: 12.5, bottom: 16.0),
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: AppColors.border),
            borderRadius: borderRadius,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// REMINDER
              Row(
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

              tags == null
                  ? SizedBox.shrink()
                  : Column(
                    children: [
                      const SizedBox(height: 16.0),
                      const Divider(height: 1.0, color: AppColors.border),
                      const SizedBox(height: 16.0),
                    ],
                  ),

              /// TAG'S
              Wrap(
                spacing: 2.0,
                runSpacing: 2.0,
                children: tags?.map((e) => TagTile(title: e)).toList() ?? [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
