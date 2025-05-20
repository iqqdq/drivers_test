import 'package:flutter/foundation.dart';

class ReminderssChangeNotifier with ChangeNotifier {
  bool _isPracticeReminderEnabled = false;
  bool get isPracticeReminderEnabled => _isPracticeReminderEnabled;

  bool _isExamReminderEnabled = false;
  bool get isExamReminderEnabled => _isExamReminderEnabled;

  void tooglePracticeReminder(bool value) {
    _isPracticeReminderEnabled = value;
    notifyListeners();
  }

  void toogleExamReminder(bool value) {
    _isExamReminderEnabled = value;
    notifyListeners();
  }
}
