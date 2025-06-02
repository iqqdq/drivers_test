import 'package:drift/drift.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/reminders/domain/domain.dart';

@UseRowClass(PracticeReminderEntity, constructor: 'fromRow')
class PracticeReminders extends Table {
  IntColumn get id => integer().withDefault(const Constant(0))();
  TextColumn get daysOfWeek => text().map(intConverter)();
  IntColumn get hour => integer()();
  IntColumn get minute => integer()();
  BoolColumn get isEnabled => boolean().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
