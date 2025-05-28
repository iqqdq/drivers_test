import 'package:drift/drift.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';

class RemindersRepositoryImpl implements RemindersRepository {
  RemindersRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Future<ExamReminderEnity?> getExamRepository() async {
    try {
      final examReminder =
          await _db.select(_db.examReminders).getSingleOrNull();
      return examReminder;
    } catch (e) {
      return null;
    }
  }

  @override
  Future setExamRepository(ExamReminderEnity examReminder) async => await _db
      .into(_db.examReminders)
      .insertOnConflictUpdate(
        ExamRemindersCompanion.insert(
          date: examReminder.dateTime,
          daysUntilRemind: Value(examReminder.daysUntilRemind),
        ),
      );

  @override
  Future<PracticeReminderEntity?> getPracticeRepository() async {
    try {
      final examReminder =
          await _db.select(_db.practiceReminders).getSingleOrNull();
      return examReminder;
    } catch (e) {
      return null;
    }
  }

  @override
  Future setPracticeRepository(PracticeReminderEntity practiceReminder) async =>
      await _db
          .into(_db.practiceReminders)
          .insertOnConflictUpdate(
            PracticeRemindersCompanion.insert(
              daysOfWeek: practiceReminder.daysOfWeek,
              hour: practiceReminder.hour,
              minute: practiceReminder.minute,
            ),
          );
}
