import 'package:drift/drift.dart';
import 'package:drivers_test/features/reminders/domain/domain.dart';

@UseRowClass(ExamReminderEnity, constructor: 'fromRow')
class ExamReminders extends Table {
  IntColumn get id => integer().withDefault(const Constant(0))();
  DateTimeColumn get date => dateTime().nullable()();
  IntColumn get hour => integer()();
  IntColumn get minute => integer()();
  IntColumn get daysUntilRemind => integer()();
  BoolColumn get isEnabled => boolean().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
