import 'package:drift/drift.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/statistics/domain/domain.dart';

@UseRowClass(TestResultEntity, constructor: 'fromRow')
class TestResultTable extends Table {
  TextColumn get testState => text()();
  TextColumn get testCategory => text()();
  TextColumn get testName => text()();
  TextColumn get answers => text().map(stringConverter)();
  TextColumn get finishedAt => text()();

  @override
  Set<Column> get primaryKey => {testState, testCategory, testName, finishedAt};
}
