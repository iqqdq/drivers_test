import 'package:drift/drift.dart';
import 'package:drivers_test/core/core.dart';

@UseRowClass(ResultEntity, constructor: 'fromRow')
class Results extends Table {
  @ReferenceName('test_result_id')
  IntColumn get testId => integer().references(Tests, #id)();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get answers => text().map(intConverter)();
  IntColumn get correctAnswerAmount => integer()();
  IntColumn get durationInSeconds => integer()();
  DateTimeColumn get completedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {testId, id},
  ];
}
