import 'package:drivers_test/ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final TimeOfDay initialTime;
  final Function(int hour, int minute) onChange;

  const TimePicker({
    super.key,
    this.initialTime = const TimeOfDay(hour: 12, minute: 0),
    required this.onChange,
  });

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;
  late FixedExtentScrollController _periodController;
  late TimeOfDay _selectedTime;

  final List<String> _hours12Format = List.generate(
    12,
    (index) => (index + 1).toString().padLeft(2, '0'),
  );
  final List<String> _minutes = List.generate(
    60,
    (index) => index.toString().padLeft(2, '0'),
  );
  final List<String> _periods = ['AM', 'PM'];

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialTime;

    final hour12 = _selectedTime.hourOfPeriod;
    final periodIndex = _selectedTime.period == DayPeriod.am ? 0 : 1;

    _hourController = FixedExtentScrollController(initialItem: hour12 - 1);
    _minuteController = FixedExtentScrollController(
      initialItem: _selectedTime.minute,
    );
    _periodController = FixedExtentScrollController(initialItem: periodIndex);
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    _periodController.dispose();
    super.dispose();
  }

  void _updateTime() {
    final hourIndex = _hourController.selectedItem % 12; // 12-hour format
    final minuteIndex = _minuteController.selectedItem % 60; // 60 minuts
    final periodIndex = _periodController.selectedItem % 2; // 2 period (AM/PM)

    final hour12 = hourIndex + 1; // transform to 1-12
    final minute = minuteIndex;
    final isAm = periodIndex == 0;

    // Converting in 24-hour format
    final hour24 =
        isAm
            ? (hour12 == 12 ? 0 : hour12) // AM: 12 -> 0, 1-11 -> как есть
            : (hour12 == 12 ? 12 : hour12 + 12); // PM: 12 -> 12, 1-11 -> +12

    setState(() {
      _selectedTime = TimeOfDay(hour: hour24, minute: minute);
    });

    widget.onChange(_selectedTime.hour, _selectedTime.minute);
  }

  Widget _buildPickerColumn({
    required FixedExtentScrollController controller,
    required List<String> items,
    bool looping = true,
  }) {
    return SizedBox(
      width: 70.0,
      child: CupertinoPicker(
        scrollController: controller,
        itemExtent: 40.0,
        diameterRatio: 1.5,
        magnification: 1.2,
        squeeze: 1.0,
        offAxisFraction: 0.0,
        useMagnifier: true,
        selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
          background: CupertinoColors.transparent,
        ),
        looping: looping,
        onSelectedItemChanged: (int index) => _updateTime(),
        children:
            items.map((item) {
              return Center(child: Text(item, style: AppTextStyles.textBody));
            }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 216.0,
      child: Stack(
        children: [
          /// SELECTION OVERLAY
          Center(
            child: Container(
              height: 32.0,
              decoration: BoxDecoration(
                color: AppColors.blue30,
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
          ),

          /// PICKER
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // HOUR'S
              _buildPickerColumn(
                controller: _hourController,
                items: _hours12Format,
              ),

              /// MINUTE'S
              _buildPickerColumn(
                controller: _minuteController,
                items: _minutes,
              ),

              /// AM/PM
              _buildPickerColumn(
                controller: _periodController,
                items: _periods,
                looping: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
