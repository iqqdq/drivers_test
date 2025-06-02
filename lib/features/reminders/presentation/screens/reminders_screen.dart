import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RemindersScreen extends StatefulWidget {
  const RemindersScreen({super.key});

  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  final _titles = [AppTitles.practiceReminder, AppTitles.examReminder];
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
      appBar: CustomAppBar(title: AppTitles.reminders),
      body: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(16.0),
        itemCount: _titles.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16.0),
        itemBuilder: (context, index) {
          return ReminderTile(
            title: _titles[index],
            tags: index == 0 ? _read.getPracticeTags() : _read.getExamTags(),
            value:
                index == 0
                    ? watch.practiceReminder.isEnabled ?? false
                    : watch.examReminder.isEnabled ?? false,
            onTap: () => _onReminderTap(index),
            onChanged: (value) => _onSwitchTap(index, value),
          );
        },
      ),
    );
  }

  // MARK: -
  // MARK: - FUNCTION'S

  void _onReminderTap(int index) =>
      router.push(RemindersRoutes.reminderSettings);

  void _onSwitchTap(int index, bool value) {
    if (index == 0) {
      _read.practiceReminder.daysOfWeek.isEmpty
          ? _onReminderTap(index)
          : _read.tooglePracticeReminder(value);
    } else {
      _read.examReminder.dateTime == null
          ? _onReminderTap(index)
          : _read.toogleExamReminder(value);
    }
  }
}
