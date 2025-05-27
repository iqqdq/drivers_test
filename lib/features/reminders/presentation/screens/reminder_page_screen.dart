import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReminderPageScreen extends StatefulWidget {
  const ReminderPageScreen({super.key});

  @override
  State<ReminderPageScreen> createState() => _ReminderPageScreenState();
}

class _ReminderPageScreenState extends State<ReminderPageScreen> {
  late final ReminderPageChangeNotifier _read;

  @override
  void initState() {
    _read = context.read<ReminderPageChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<ReminderPageChangeNotifier>();

    return Scaffold(
      appBar: CustomAppBar(
        title: AppTitles.newReminder,
        actions: [
          CustomAppBarAction(
            title: AppTitles.reset,
            onTap: watch.isCanReset, // TODO CHECK IF REMINDER IS NULL
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8.0),

          /// SEGMENTED CONTROL
          CustomSegmentedControl(
            titles: [AppTitles.practice, AppTitles.exam],
            selected: watch.type == ReminderType.practice ? 0 : 1,
            onTap: _onSegmentTap,
          ),
          const SizedBox(height: 16.0),

          /// DAY'S AND TIME SETTING
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(16.0),
              children: [
                /// TITLE
                Text(
                  AppTitles.setDaysAndTimeForPractice,
                  style: AppTextStyles.textBody.copyWith(
                    color: AppColors.black70,
                  ),
                ),
                const SizedBox(height: 16.0),

                /// DAY PICKER
                watch.type == ReminderType.practice
                    ? TitleContainer(
                      title: AppTitles.setTheDays,
                      child: DayPicker(days: watch.days, onTap: _onDayNameTap),
                    )
                    :
                    /// DATE PICKER
                    TitleContainer(
                      title: AppTitles.setTheDate,
                      spacing: 8.0,
                      child: DatePicker(
                        dateTime: watch.dateTime,
                        onDateSelected: _onDateSelect,
                      ),
                    ),
                const SizedBox(height: 16.0),

                /// TIME PICKER
                TitleContainer(
                  title: AppTitles.setTheTime,
                  child: TimePicker(
                    initialTime: TimeOfDay(
                      hour: DateTime.now().hour,
                      minute: DateTime.now().minute,
                    ),
                    onChange: _setTime,
                  ),
                ),

                const SizedBox(height: 16.0),

                /// WEEKDAY LIST VIEW
                TitleContainer(
                  title: AppTitles.remindBeforeDays,
                  child: WeekdayListView(
                    selected: watch.dayAmount,
                    onTap: _onDayAmountTap,
                  ),
                ),
              ],
            ),
          ),

          /// APPLY BUTTON
          Padding(
            padding: EdgeInsets.all(
              16.0,
            ).copyWith(bottom: getBottomPadding(context)),
            child: PrimaryButton(
              title: AppTitles.apply,
              onTap: watch.isValid() ? () {} : null,
            ),
          ),
        ],
      ),
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onSegmentTap(int index) => _read.setReminderType(
    index == 0 ? ReminderType.practice : ReminderType.exam,
  );

  void _onDayNameTap(int day) => _read.setDay(day);

  void _onDateSelect(DateTime dateTime) => _read.setDateTime(dateTime);

  void _setTime(int hour, int minute) => _read.setTime(hour, minute);

  void _onDayAmountTap(int index) => _read.setRemindBefore(index);
}
