import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';

enum ReminderType { practice, exam }

class RemindersChangeNotifier with ChangeNotifier {
  ReminderType _type = ReminderType.practice;
  ReminderType get type => _type;

  PracticeReminderEntity _practiceReminder = PracticeReminderEntity();
  PracticeReminderEntity get practiceReminder => _practiceReminder;

  ExamReminderEnity _examReminder = ExamReminderEnity();
  ExamReminderEnity get examReminder => _examReminder;

  bool get isValid =>
      _type == ReminderType.practice
          ? _practiceReminder.daysOfWeek.isNotEmpty
          : _examReminder.dateTime != null;

  Future _savePracticeReminder() async => await sl
      .get<RemindersRepository>()
      .setPracticeReminder(_practiceReminder);

  Future _saveExamReminder() async =>
      await sl.get<RemindersRepository>().setExamReminder(_examReminder);

  Future getReminders() async {
    _practiceReminder =
        await sl.get<RemindersRepository>().getPracticeReminder() ??
        PracticeReminderEntity();
    _examReminder =
        await sl.get<RemindersRepository>().getExamReminder() ??
        ExamReminderEnity();

    // Проверяем, если уведомление устарело - удаляем
    if (_examReminder.dateTime != null) {
      if (_examReminder.dateTime!.isBefore(DateTime.now())) {
        _examReminder = ExamReminderEnity();
        _saveExamReminder();
      }
    }

    notifyListeners();
  }

  List<String>? getPracticeTags() {
    final days =
        _practiceReminder.daysOfWeek.length == 7
            ? AppTitles.everyday
            : _practiceReminder.daysOfWeek
                .map((index) => weekDays[index])
                .toList()
                .join(', ');
    final time =
        '${_practiceReminder.hour.toTimeUnit()}:${_practiceReminder.minute.toTimeUnit()}';
    return days.isEmpty ? null : [days, time];
  }

  List<String>? getExamTags() {
    final date = _examReminder.dateTime?.toDateString();
    final time =
        '${_examReminder.hour.toTimeUnit()}:${_examReminder.minute.toTimeUnit()}';
    final remind =
        _examReminder.daysUntilRemind == 0
            ? null
            : '${AppTitles.remindBefore} ${_examReminder.daysUntilRemind + 1} ${AppTitles.days}';
    return date == null
        ? null
        : remind == null
        ? [date, time]
        : [date, time, remind];
  }

  Future tooglePracticeReminder(bool value) async {
    if (_practiceReminder.daysOfWeek.isEmpty) return;

    _practiceReminder.isEnabled = value;
    notifyListeners();

    await _savePracticeReminder().whenComplete(() async {
      if (value) {
        await sl.get<NotificationService>().scheduleRepeatingNotification(
          id: 0,
          title: AppTitles.practiceNotificationTitle,
          body: AppTitles.practiceNotificationBody,
          daysOfWeek: _practiceReminder.daysOfWeek,
          hour: _practiceReminder.hour,
          minute: _practiceReminder.minute,
        );
      } else {
        await Future.wait(
          practiceReminder.daysOfWeek.map(
            (e) => sl.get<NotificationService>().cancelNotification(1 + e),
          ),
        );
      }
    });
  }

  Future toogleExamReminder(bool value) async {
    if (_examReminder.dateTime == null) return;

    _examReminder.isEnabled = value;
    notifyListeners();

    await _saveExamReminder().whenComplete(() async {
      if (value) {
        final notificationDateTime = _examReminder.dateTime!
            .copyWith(hour: _examReminder.hour, minute: _examReminder.minute)
            .add(Duration(days: _examReminder.daysUntilRemind));
        final difference = notificationDateTime.difference(DateTime.now());

        await sl.get<NotificationService>().scheduleNotification(
          id: 0,
          title: AppTitles.examNotificationTitle,
          body:
              '${AppTitles.examNotificationBody} ${_examReminder.dateTime!.toDateString()}',
          delay: difference,
        );
      } else {
        await sl.get<NotificationService>().cancelNotification(0);
      }
    });
  }

  void setReminderType(ReminderType type) {
    _type = type;
    notifyListeners();
  }

  void setDaysOfWeek(List<int> daysOfWeek) {
    if (daysOfWeek.isEmpty) {
      _practiceReminder.daysOfWeek.clear();
    } else {
      if (daysOfWeek.length == 1) {
        final day = daysOfWeek.first;
        _practiceReminder.daysOfWeek.contains(day)
            ? _practiceReminder.daysOfWeek.remove(day)
            : _practiceReminder.daysOfWeek.add(day);
      } else {
        _practiceReminder.daysOfWeek.addAll(daysOfWeek);
        _practiceReminder.daysOfWeek =
            _practiceReminder.daysOfWeek.toSet().toList();
      }
      _practiceReminder.daysOfWeek.sort();
    }
    notifyListeners();
  }

  void setTime(int hour, int minute) {
    if (_type == ReminderType.practice) {
      _practiceReminder.hour = hour;
      _practiceReminder.minute = minute;
    } else {
      _examReminder.hour = hour;
      _examReminder.minute = minute;
    }
    notifyListeners();
  }

  void setDate(DateTime dateTime) {
    _examReminder.dateTime = dateTime;
    notifyListeners();
  }

  void setRemindBefore(int value) {
    _examReminder.daysUntilRemind = value;
    notifyListeners();
  }

  void reset() {
    if (_type == ReminderType.practice) {
      _practiceReminder.daysOfWeek.clear();
    } else {
      _examReminder.dateTime = null;
      _examReminder.daysUntilRemind = 0;
    }
    notifyListeners();
  }
}
