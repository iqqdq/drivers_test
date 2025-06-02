import 'package:drivers_test/core/core.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final DateTime? dateTime;
  final Function(DateTime dateTime) onChange;

  const DatePicker({super.key, this.dateTime, required this.onChange});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime _today;
  late DateTime _tomorrow; // Добавлено поле для завтрашней даты
  late DateTime _currentMonth;
  DateTime? _currentDate;

  @override
  void initState() {
    super.initState();
    _today = DateTime.now();
    _tomorrow = DateTime(
      _today.year,
      _today.month,
      _today.day + 1,
    ); // Инициализация завтрашней даты

    _currentDate = widget.dateTime;
    _currentMonth = DateTime(
      _currentDate?.year ??
          _tomorrow.year, // Используем завтрашнюю дату как минимальную
      _currentDate?.month ?? _tomorrow.month,
      1,
    );
  }

  @override
  void didUpdateWidget(DatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.dateTime != oldWidget.dateTime) {
      _currentDate = widget.dateTime;
      _currentMonth = DateTime(
        _currentDate?.year ??
            _tomorrow.year, // Используем завтрашнюю дату как минимальную
        _currentDate?.month ?? _tomorrow.month,
        1,
      );
    }
  }

  void _goToMonth(DateTime month) =>
      setState(() => _currentMonth = DateTime(month.year, month.month, 1));

  void _previousMonth() {
    final prevMonth = DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
    setState(() => _currentMonth = prevMonth);
  }

  void _nextMonth() => setState(
    () =>
        _currentMonth = DateTime(
          _currentMonth.year,
          _currentMonth.month + 1,
          1,
        ),
  );

  void _onDateSelected(DateTime dateTime) {
    if (!_isDateBeforeTomorrow(dateTime)) {
      // Изменено на проверку "до завтра"
      setState(() => _currentDate = dateTime);
      widget.onChange(dateTime);
    }
  }

  bool _isDateBeforeTomorrow(DateTime date) {
    // Новая функция проверки
    final tomorrow = DateTime(_tomorrow.year, _tomorrow.month, _tomorrow.day);
    final inputDate = DateTime(date.year, date.month, date.day);
    return inputDate.isBefore(tomorrow);
  }

  bool _isDateSelectable(DateTime date) {
    return !_isDateBeforeTomorrow(date); // Используем новую функцию проверки
  }

  @override
  Widget build(BuildContext context) {
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

  Widget _buildWeekDays() => Row(
    children:
        weekDays
            .map(
              (day) => Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: AppTextStyles.footnoteRegular.copyWith(
                      color: AppColors.black70,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
  );

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
            final isSelectable = _isDateSelectable(date);

            return Expanded(
              child: GestureDetector(
                onTap:
                    isSelectable
                        ? () {
                          if (isPrevMonth || isNextMonth) {
                            _goToMonth(date);
                          } else {
                            _onDateSelected(date);
                          }
                        }
                        : null,
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color:
                        isSelected
                            ? AppColors.blue100
                            : !isSelectable
                            ? AppColors.black10.withValues(alpha: 0.1)
                            : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      date.day.toString(),
                      style: AppTextStyles.footnote.copyWith(
                        color:
                            isSelected
                                ? AppColors.white
                                : !isSelectable
                                ? AppColors.black20
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
