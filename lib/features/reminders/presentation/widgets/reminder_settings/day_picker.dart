import 'package:drivers_test/features/features.dart';
import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DayPicker extends StatefulWidget {
  final List<int> daysOfWeek;
  final Function(List<int> days) onTap;

  const DayPicker({super.key, required this.daysOfWeek, required this.onTap});

  @override
  State<DayPicker> createState() => _DayPickerState();
}

class _DayPickerState extends State<DayPicker>
    with AutomaticKeepAliveClientMixin {
  bool? _isExapnded;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final padding = 16.0;
    final spacing = 2.0;
    final width =
        (MediaQuery.of(context).size.width - padding * 4.0) / weekDays.length;

    return Column(
      children: [
        /// EVERYDAY CHECKBOX
        GestureDetector(
          onTap: _onEveryDayTap,
          child: Row(
            children: [
              Expanded(
                child: Text(AppTitles.everyday, style: AppTextStyles.textBody),
              ),
              const SizedBox(width: 12.0),
              CustomCheckbox(isSelected: widget.daysOfWeek.length == 7),
            ],
          ),
        ),
        const SizedBox(height: 32.0),

        /// DAY OF THE WEEK SELECTION
        GestureDetector(
          onTap: _onArrowTap,
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
                _isExapnded == null
                    ? AppIcons.arrowDown
                    : _isExapnded!
                    ? AppIcons.arrowDown
                    : AppIcons.arrowUp,
              ),
            ],
          ),
        ),

        /// DAY LIST VIEW
        _isExapnded == null
            ? SizedBox.shrink()
            : !_isExapnded!
            ? SizedBox.shrink()
            : Container(
              margin: EdgeInsets.only(top: 16.0),
              height: width * 0.9,
              child: ListView.separated(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: weekDays.length,
                separatorBuilder: (context, index) => SizedBox(width: spacing),
                itemBuilder: (context, index) {
                  return OvalTile(
                    height: width - spacing,
                    title: weekDays[index],
                    isSelected: widget.daysOfWeek.contains(index),
                    onTap: () => _onDayTap(index),
                  );
                },
              ),
            ),
      ],
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onArrowTap() {
    setState(() => _isExapnded = !(_isExapnded ?? false));
    widget.onTap([]);
  }

  void _onEveryDayTap() {
    setState(() => _isExapnded = false);
    widget.onTap([0, 1, 2, 3, 4, 5, 6]);
  }

  void _onDayTap(int index) {
    widget.onTap([index]);
  }
}
