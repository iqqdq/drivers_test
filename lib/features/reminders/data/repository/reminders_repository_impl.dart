import 'package:drift/drift.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';

class RemindersRepositoryImpl implements RemindersRepository {
  RemindersRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Future<PracticeReminderEntity?> getPracticeReminder() async {
    try {
      final examReminder =
          await _db.select(_db.practiceReminders).getSingleOrNull();
      return examReminder;
    } catch (e) {
      return null;
    }
  }

  @override
  Future setPracticeReminder(PracticeReminderEntity practiceReminder) async =>
      await _db
          .into(_db.practiceReminders)
          .insertOnConflictUpdate(
            PracticeRemindersCompanion.insert(
              id: Value(0),
              daysOfWeek: practiceReminder.daysOfWeek,
              hour: practiceReminder.hour,
              minute: practiceReminder.minute,
            ),
          );

  @override
  Future<ExamReminderEnity?> getExamReminder() async {
    try {
      final examReminder =
          await _db.select(_db.examReminders).getSingleOrNull();
      return examReminder;
    } catch (e) {
      return null;
    }
  }

  @override
  Future setExamReminder(ExamReminderEnity examReminder) async => await _db
      .into(_db.examReminders)
      .insertOnConflictUpdate(
        ExamRemindersCompanion.insert(
          id: Value(0),
          date: examReminder.dateTime,
          daysUntilRemind: Value(examReminder.daysUntilRemind),
        ),
      );
}
