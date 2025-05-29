import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';

enum ReminderType { practice, exam }

class RemindersChangeNotifier with ChangeNotifier {
  ReminderType _type = ReminderType.practice;
  ReminderType get type => _type;

  bool _isPracticeReminderEnabled = false;
  bool get isPracticeReminderEnabled => _isPracticeReminderEnabled;

  bool _isExamReminderEnabled = false;
  bool get isExamReminderEnabled => _isExamReminderEnabled;

  PracticeReminderEntity? _practiceReminder;
  PracticeReminderEntity? get practiceReminder => _practiceReminder;

  ExamReminderEnity? _examReminder;
  ExamReminderEnity? get examReminder => _examReminder;

  final List<int> _daysOfWeek = [];
  List<int> get daysOfWeek => _daysOfWeek;

  int _practiceHour = DateTime.now().hour;
  int get practiceHour => _practiceHour;

  int _practiceMinute = DateTime.now().minute;
  int get practiceMinute => _practiceMinute;

  int _examHour = DateTime.now().hour;
  int get examHour => _examHour;

  int _examMinute = DateTime.now().minute;
  int get examMinute => _examMinute;

  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;

  int? _daysUntilRemind;
  int? get daysUntilRemind => _daysUntilRemind;

  bool get isCanReset =>
      _type == ReminderType.practice
          ? _daysOfWeek.isNotEmpty || _daysUntilRemind == null
          : _dateTime != null;

  bool get isValid =>
      _type == ReminderType.practice
          ? _daysOfWeek.isNotEmpty
          : _dateTime != null;

  void _requestPermission() async {
    await sl.get<NotificationService>().requestNotificationPermission();
  }

  Future getReminders() async {
    _practiceReminder =
        await sl.get<RemindersRepository>().getPracticeReminder();
    _examReminder = await sl.get<RemindersRepository>().getExamReminder();
    notifyListeners();
  }

  List<String>? getPracticeTags() {
    if (practiceReminder == null) return null;
    final dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final days = _daysOfWeek
        .map((index) => dayNames[index])
        .toList()
        .join(', ');
    final time =
        '${practiceReminder!.hour.toTimeUnit()}:${practiceReminder!.minute.toTimeUnit()}';
    return days.isEmpty ? [] : [days, time];
  }

  List<String>? getExamTags() {
    if (examReminder == null) return null;
    final date = examReminder!.dateTime.toDateString();
    final time =
        '${examReminder!.dateTime.hour.toTimeUnit()}:${examReminder!.dateTime.minute.toTimeUnit()}';
    final remind =
        examReminder!.daysUntilRemind == null
            ? null
            : '${AppTitles.remindBefore} ${examReminder!.daysUntilRemind! + 1} ${AppTitles.days}';
    return remind == null ? [date, time] : [date, time, remind];
  }

  Future tooglePracticeReminder(bool value) async {
    _requestPermission();
    _isPracticeReminderEnabled = value;
    notifyListeners();

    if (_practiceReminder != null) {
      if (value) {
        await sl.get<NotificationService>().scheduleRepeatingNotification(
          id: 0,
          title: AppTitles.practiceNotificationTitle,
          body: AppTitles.practiceNotificationBody,
          daysOfWeek: _practiceReminder!.daysOfWeek,
          hour: _practiceReminder!.hour,
          minute: _practiceReminder!.minute,
        );
      } else {
        await sl.get<NotificationService>().cancelNotification(0);
      }
    }
  }

  Future toogleExamReminder(bool value) async {
    _requestPermission();
    _isExamReminderEnabled = value;
    notifyListeners();

    if (_examReminder != null) {
      if (value) {
        final daysUntilRemind = _examReminder!.daysUntilRemind ?? 0;
        final delay = DateTime.now().difference(
          _examReminder!.dateTime.subtract(Duration(days: daysUntilRemind)),
        );

        await sl.get<NotificationService>().scheduleNotification(
          id: 1,
          title: AppTitles.examNotificationTitle,
          body:
              '${AppTitles.examNotificationBody} ${_examReminder!.dateTime.toDateString()}',
          delay: delay.isNegative ? -delay : delay,
        );
      } else {
        await sl.get<NotificationService>().cancelNotification(1);
      }
    }
  }

  void setIsEveryday(bool value) {
    _daysOfWeek.addAll([1, 2, 3, 4, 5, 6, 7]);
    notifyListeners();
  }

  void setReminderType(ReminderType type) {
    _type = type;
    notifyListeners();
  }

  void setDay(int value) {
    _daysOfWeek.contains(value)
        ? _daysOfWeek.removeWhere((e) => e == value)
        : _daysOfWeek.add(value);
    _daysOfWeek.sort();
    notifyListeners();
  }

  void setTime(int hour, int minute) {
    if (_type == ReminderType.practice) {
      _practiceHour = hour;
      _practiceMinute = minute;
    } else {
      _examHour = hour;
      _examMinute = minute;
    }

    notifyListeners();
  }

  void setDateTime(DateTime dateTime) {
    _dateTime = dateTime;
    notifyListeners();
  }

  void setRemindBefore(int value) {
    _daysUntilRemind = value;
    notifyListeners();
  }

  void reset() {
    _type == ReminderType.practice
        ? {_daysOfWeek.clear(), _daysUntilRemind = null}
        : {_dateTime = null, _daysUntilRemind = null};
    _dateTime = null;
    notifyListeners();
  }

  Future addReminder() async {
    if (_type == ReminderType.practice) {
      await sl.get<RemindersRepository>().setPracticeReminder(
        PracticeReminderEntity(
          daysOfWeek: _daysOfWeek,
          hour: _practiceHour,
          minute: _practiceMinute,
        ),
      );
      tooglePracticeReminder(true);
    } else {
      await sl.get<RemindersRepository>().setExamReminder(
        ExamReminderEnity(
          dateTime: _dateTime!.copyWith(hour: _examHour, minute: _examMinute),
          daysUntilRemind: daysUntilRemind,
        ),
      );
      toogleExamReminder(true);
    }

    notifyListeners();
  }
}
