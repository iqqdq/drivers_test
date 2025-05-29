import 'package:drivers_test/features/features.dart';

abstract interface class RemindersRepository {
  Future<PracticeReminderEntity?> getPracticeReminder();
  Future setPracticeReminder(PracticeReminderEntity practiceReminder);
  Future<ExamReminderEnity?> getExamReminder();
  Future setExamReminder(ExamReminderEnity examReminder);
}
