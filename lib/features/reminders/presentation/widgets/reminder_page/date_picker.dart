import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final DateTime? dateTime;
  final Function(DateTime dateTime) onDateSelected;

  const DatePicker({super.key, this.dateTime, required this.onDateSelected});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime _currentMonth;
  DateTime? _currentDate;

  void _goToMonth(DateTime month) {
    setState(() {
      _currentMonth = DateTime(month.year, month.month, 1);
      _currentDate = DateTime(month.year, month.month, month.day);
    });
  }

  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
    });
  }

  void _onDateSelected(DateTime dateTime) {
    setState(() {
      _currentDate = dateTime;
    });
    widget.onDateSelected(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    _currentDate = widget.dateTime;
    _currentMonth = DateTime(
      _currentDate?.year ?? DateTime.now().year,
      _currentDate?.month ?? DateTime.now().month,
      1,
    );

    return Column(
      children: [
        _buildHeader(),
        const SizedBox(height: 16.0),
        _buildWeekDays(),
        const SizedBox(height: 16.0),
        _buildCalendarGrid(),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${_getMonthName(_currentMonth.month)} ${_currentMonth.year}',
          style: AppTextStyles.textBody,
        ),
        Row(
          children: [
            IconButton(
              highlightColor: Colors.transparent,
              icon: const Icon(Icons.chevron_left),
              onPressed: _previousMonth,
            ),
            IconButton(
              highlightColor: Colors.transparent,
              icon: const Icon(Icons.chevron_right),
              onPressed: _nextMonth,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWeekDays() {
    const weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return Row(
      children:
          weekDays.map((day) {
            return Expanded(
              child: Center(
                child: Text(
                  day,
                  style: AppTextStyles.footnoteRegular.copyWith(
                    color: AppColors.black70,
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildCalendarGrid() {
    final firstDayOfMonth = _currentMonth;
    final daysInMonth =
        DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
    final firstWeekdayOfMonth = firstDayOfMonth.weekday;
    final daysFromPrevMonth = firstWeekdayOfMonth - 1;

    final lastDayOfMonth = DateTime(
      _currentMonth.year,
      _currentMonth.month + 1,
      0,
    );
    final daysFromNextMonth = 7 - lastDayOfMonth.weekday;

    final totalDays = daysFromPrevMonth + daysInMonth + daysFromNextMonth;
    final weeks = (totalDays / 7).ceil();

    return Column(
      children: List.generate(weeks, (week) {
        return Row(
          children: List.generate(7, (day) {
            final dayNumber = week * 7 + day + 1 - daysFromPrevMonth;
            DateTime date;
            bool isCurrentMonth = false;
            bool isPrevMonth = false;
            bool isNextMonth = false;

            if (dayNumber <= 0) {
              // Prev month day's
              final prevMonth = DateTime(
                _currentMonth.year,
                _currentMonth.month - 1,
                1,
              );
              final daysInPrevMonth =
                  DateTime(prevMonth.year, prevMonth.month + 1, 0).day;
              date = DateTime(
                prevMonth.year,
                prevMonth.month,
                daysInPrevMonth + dayNumber,
              );
              isPrevMonth = true;
            } else if (dayNumber > daysInMonth) {
              // Next month day's
              date = DateTime(
                _currentMonth.year,
                _currentMonth.month + 1,
                dayNumber - daysInMonth,
              );
              isNextMonth = true;
            } else {
              // Current month day's
              date = DateTime(
                _currentMonth.year,
                _currentMonth.month,
                dayNumber,
              );
              isCurrentMonth = true;
            }

            final isSelected =
                _currentDate?.year == date.year &&
                _currentDate?.month == date.month &&
                _currentDate?.day == date.day;

            return Expanded(
              child: GestureDetector(
                onTap: () {
                  if (isPrevMonth || isNextMonth) {
                    _goToMonth(date);
                  } else {
                    _onDateSelected(date);
                  }
                },
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.blue100 : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      date.day.toString(),
                      style: AppTextStyles.footnote.copyWith(
                        color:
                            isSelected
                                ? AppColors.white
                                : isCurrentMonth
                                ? AppColors.black100
                                : AppColors.black20,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  String _getMonthName(int month) {
    const monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return monthNames[month - 1];
  }
}
