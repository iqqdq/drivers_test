import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/material.dart';

class CustomSegmentedControl extends StatelessWidget {
  final List<String> titles;
  final int selected;
  final Function(int index) onTap;

  const CustomSegmentedControl({
    super.key,
    required this.titles,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final padding = 16.0;
    final spacing = 8.0;

    return SizedBox(
      height: 40.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: titles.length,
        separatorBuilder: (context, index) => SizedBox(width: spacing),
        itemBuilder: (context, index) {
          final width =
              ((MediaQuery.of(context).size.width - padding) / titles.length) -
              spacing;

          return CustomSegmentedControlButton(
            width: width,
            title: titles[index],
            isSelected: selected == index,
            onTap: () => onTap(index),
          );
        },
      ),
    );
  }
}

class CustomSegmentedControlButton extends StatelessWidget {
  final double width;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomSegmentedControlButton({
    super.key,
    required this.width,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(32.0);

    return Material(
      color: isSelected ? AppColors.blue100 : AppColors.card,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          width: width,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border:
                isSelected
                    ? null
                    : Border.all(width: 1.0, color: AppColors.border),
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.textSubheadline.copyWith(
                color: isSelected ? AppColors.white : AppColors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
