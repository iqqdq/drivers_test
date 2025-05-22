import 'package:drift/drift.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/testing/data/data.dart';
import 'package:drivers_test/features/testing/domain/domain.dart';

@UseRowClass(ResultEntity, constructor: 'fromRow')
class ResultTable extends Table {
  @ReferenceName('by_id')
  IntColumn get testId => integer().references(TestTable, #id)();
  @ReferenceName('by_name')
  TextColumn get testName => text().references(TestTable, #name)();
  @ReferenceName('by_amount')
  IntColumn get testAmount => integer().references(TestTable, #amount)();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get answers => text().map(intConverter)();
  IntColumn get correct => integer()();
  IntColumn get durationInSeconds => integer()();
  DateTimeColumn get completedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {testId, id},
  ];
}
