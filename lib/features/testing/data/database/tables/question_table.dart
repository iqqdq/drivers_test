import 'package:drift/drift.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/testing/data/data.dart';
import 'package:drivers_test/features/testing/domain/domain.dart';

@UseRowClass(QuestionEntity, constructor: 'fromRow')
class QuestionTable extends Table {
  IntColumn get testId => integer().references(TestTable, #id)();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get image => text().nullable()();
  TextColumn get question => text()();
  TextColumn get choices => text().map(stringConverter)();
  IntColumn get correct => integer()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {testId, id},
  ];
}
