import 'package:drivers_test/features/features.dart';
import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DayPicker extends StatefulWidget {
  final List<int> days;
  final Function(int day) onTap;

  const DayPicker({super.key, required this.days, required this.onTap});

  @override
  State<DayPicker> createState() => _DayPickerState();
}

class _DayPickerState extends State<DayPicker>
    with AutomaticKeepAliveClientMixin {
  bool _isEveryday = true;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final padding = 16.0;
    final spacing = 2.0;
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final width =
        (MediaQuery.of(context).size.width - padding * 4.0) / days.length;

    return Column(
      children: [
        /// EVERYDAY CHECKBOX
        GestureDetector(
          onTap: () => setState(() => _isEveryday = true),
          child: Row(
            children: [
              Expanded(
                child: Text(AppTitles.everyday, style: AppTextStyles.textBody),
              ),
              const SizedBox(width: 12.0),
              CustomCheckbox(isSelected: _isEveryday),
            ],
          ),
        ),
        const SizedBox(height: 32.0),

        /// DAY OF THE WEEK SELECTION
        GestureDetector(
          onTap: () => setState(() => _isEveryday = !_isEveryday),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  AppTitles.dayOfTheWeek,
                  style: AppTextStyles.textBody,
                ),
              ),
              const SizedBox(width: 12.0),
              SvgPicture.asset(
                _isEveryday ? AppIcons.arrowDown : AppIcons.arrowUp,
              ),
            ],
          ),
        ),
        SizedBox(height: _isEveryday ? 0.0 : 16.0),

        /// DAY LIST VIEW
        _isEveryday
            ? SizedBox.shrink()
            : SizedBox(
              height: width * 0.9,
              child: ListView.separated(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: days.length,
                separatorBuilder: (context, index) => SizedBox(width: spacing),
                itemBuilder: (context, index) {
                  return OvalTile(
                    height: width - spacing,
                    title: days[index],
                    isSelected: widget.days.contains(index),
                    onTap: () => widget.onTap(index),
                  );
                },
              ),
            ),
      ],
    );
  }
}
