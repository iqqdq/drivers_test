import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReminderSettingsScreen extends StatefulWidget {
  const ReminderSettingsScreen({super.key});

  @override
  State<ReminderSettingsScreen> createState() => _ReminderPageScreenState();
}

class _ReminderPageScreenState extends State<ReminderSettingsScreen> {
  late final RemindersChangeNotifier _read;

  @override
  void initState() {
    _read = context.read<RemindersChangeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<RemindersChangeNotifier>();

    return Scaffold(
      appBar: CustomAppBar(
        title: AppTitles.newReminder,
        actions: [
          CustomAppBarAction(
            title: AppTitles.reset,
            onTap: watch.isValid ? _onResetTap : null,
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
                      child: DayPicker(
                        daysOfWeek: watch.practiceReminder.daysOfWeek,
                        onTap: _onDayNameTap,
                      ),
                    )
                    :
                    /// DATE PICKER
                    TitleContainer(
                      title: AppTitles.setTheDate,
                      spacing: 8.0,
                      child: DatePicker(
                        dateTime: watch.examReminder.dateTime,
                        onChange: _onDateSelect,
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
                watch.type == ReminderType.practice
                    ? SizedBox.shrink()
                    : watch.examReminder.dateTime == null
                    ? SizedBox.shrink()
                    : TitleContainer(
                      title: AppTitles.remindBeforeDays,
                      child: WeekdayListView(
                        targetDate: watch.examReminder.dateTime!,
                        selected: watch.examReminder.daysUntilRemind,
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
              onTap: watch.isValid ? _onApplyTap : null,
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

  void _onDayNameTap(List<int> daysOfWeek) => _read.setDaysOfWeek(daysOfWeek);

  void _onDateSelect(DateTime dateTime) => _read.setDate(dateTime);

  void _setTime(int hour, int minute) => _read.setTime(hour, minute);

  void _onDayAmountTap(int index) => _read.setRemindBefore(index);

  void _onResetTap() => _read.reset();

  void _onApplyTap() async {
    _read.type == ReminderType.practice
        ? await _read.tooglePracticeReminder(true)
        : await _read.toogleExamReminder(true);
    router.pop();
  }
}
