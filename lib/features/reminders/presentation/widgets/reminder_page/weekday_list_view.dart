import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';

class WeekdayListView extends StatelessWidget {
  final int? selected;
  final Function(int index) onTap;

  const WeekdayListView({
    super.key,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final padding = 16.0;
    final spacing = 2.0;
    final width = (MediaQuery.of(context).size.width - padding * 4.0) / 7.0;

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
          return OvalTile(
            height: width - spacing,
            title: '${index + 1}',
            isSelected: selected == index,
            onTap: () => onTap(index),
          );
        },
      ),
    );
  }
}
