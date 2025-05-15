import 'package:drift/drift.dart';
// import 'package:drivers_test/features/testing/domain/domain.dart';

// @UseRowClass(TestEntity, constructor: 'fromRow')
class TestTable extends Table {
  TextColumn get category => text()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {category, name};
}
