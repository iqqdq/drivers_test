import 'package:drift/drift.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/testing/domain/domain.dart';

@UseRowClass(QuestionEntity, constructor: 'fromRow')
class QuestionTable extends Table {
  TextColumn get testCategory => text()();
  TextColumn get testName => text()();
  TextColumn get image => text().nullable()();
  TextColumn get question => text()();
  TextColumn get answers => text().map(const ListConverter())();
  IntColumn get correct => integer()();
  IntColumn get answer => integer().nullable()();

  @override
  Set<Column> get primaryKey => {testCategory, testName, question};
}
