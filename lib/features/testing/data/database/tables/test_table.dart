import 'package:drift/drift.dart';
import 'package:drivers_test/features/testing/domain/domain.dart';

@UseRowClass(TestEntity, constructor: 'fromRow')
class TestTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get state => text()();
  TextColumn get name => text()();
  IntColumn get amount => integer()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {state, id},
  ];
}
