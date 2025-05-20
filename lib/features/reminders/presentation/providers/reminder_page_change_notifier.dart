import 'package:drivers_test/features/reminders/domain/entities/entities.dart';
import 'package:flutter/material.dart';

enum ReminderType { practice, exam }

class ReminderPageChangeNotifier with ChangeNotifier {
  ReminderType _type = ReminderType.practice;
  ReminderType get type => _type;

  final PracticeReminderEntity _practiceReminder = PracticeReminderEntity();
  PracticeReminderEntity get practiceReminder => _practiceReminder;

  final ExamReminderEnity _examReminder = ExamReminderEnity();
  ExamReminderEnity get examReminder => _examReminder;

  bool isPracticeReminderCanReset() =>
      _practiceReminder.days != null ||
      _practiceReminder.daysUntilRemind != null;

  bool isExamReminderCanReset() =>
      _examReminder.dateTime != null || _examReminder.daysUntilRemind != null;

  bool isPracticeReminderValid() =>
      _practiceReminder.days != null &&
      _practiceReminder.daysUntilRemind != null;

  bool isExamReminderValid() =>
      _examReminder.dateTime != null && _examReminder.daysUntilRemind != null;

  // TODO REPLACE
  bool? _isEveryday;
  bool? get isEveryday => _isEveryday;

  final List<int> _days = [];
  List<int> get days => _days;

  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;

  int? _dayAmount;
  int? get dayAmount => _dayAmount;

  bool isCanReset() =>
      _type == ReminderType.practice
          ? _isEveryday != null || _days.isNotEmpty || _dayAmount == null
          : _dateTime != null;

  bool isValid() =>
      _type == ReminderType.practice ? _isEveryday == null : _dateTime == null;

  void setIsEveryday(bool value) {
    _isEveryday = value;
    notifyListeners();
  }

  void setReminderType(ReminderType type) {
    _type = type;
    notifyListeners();
  }

  void setDay(int value) {
    _days.contains(value)
        ? _days.removeWhere((e) => e == value)
        : _days.add(value);
    notifyListeners();
  }

  void setTime(int hour, int minute) {
    _dateTime = _dateTime?.copyWith(hour: hour, minute: minute);
    notifyListeners();
  }

  void setDateTime(DateTime dateTime) {
    _dateTime = dateTime;
    notifyListeners();
  }

  void setRemindBefore(int value) {
    _dayAmount = value;
    notifyListeners();
  }

  void reset() {
    _type == ReminderType.practice
        ? {_isEveryday = null, _dayAmount = null}
        : {_dateTime = null, _dayAmount = null};
    _dateTime = DateTime.now();
    notifyListeners();
  }
}
