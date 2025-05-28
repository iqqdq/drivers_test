import 'package:drivers_test/features/features.dart';

abstract interface class RemindersRepository {
  Future<ExamReminderEnity?> getExamRepository();
  Future setExamRepository(ExamReminderEnity examReminder);
  Future<PracticeReminderEntity?> getPracticeRepository();
  Future setPracticeRepository(PracticeReminderEntity practiceReminder);
}
