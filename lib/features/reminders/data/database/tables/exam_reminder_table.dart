import 'package:drift/drift.dart';
import 'package:drivers_test/features/reminders/domain/domain.dart';

@UseRowClass(ExamReminderEnity, constructor: 'fromRow')
class ExamReminders extends Table {
  IntColumn get id => integer().withDefault(const Constant(0))();
  DateTimeColumn get date => dateTime()();
  IntColumn get daysUntilRemind => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
