import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';

class WeekdayListView extends StatelessWidget {
  final DateTime targetDate;
  final int? selected;
  final Function(int index) onTap;

  const WeekdayListView({
    super.key,
    required this.targetDate,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final padding = 16.0;
    final spacing = 2.0;
    final width = (MediaQuery.of(context).size.width - padding * 4.0) / 7.0;

    final now = DateTime.now();
    final difference = targetDate.difference(now).inDays;

    return SizedBox(
      height: width * 0.9,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 7,
        separatorBuilder: (context, index) => SizedBox(width: spacing),
        itemBuilder: (context, index) {
          return IgnorePointer(
            ignoring: index >= difference,
            child: Opacity(
              opacity: index >= difference ? 0.5 : 1.0,
              child: OvalTile(
                height: width - spacing,
                title: '${index + 1}',
                isSelected: index >= difference ? false : selected == index,
                onTap: () => onTap(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
