import 'package:drift/drift.dart';
import 'package:drivers_test/core/core.dart';

@UseRowClass(TestEntity, constructor: 'fromRow')
class Tests extends Table {
  TextColumn get state => text()();
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get isExam => boolean().withDefault(const Constant(false))();
  TextColumn get questionIds => text().map(intConverter)();
  RealColumn get minPassRatio => real()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {state, id},
  ];
}
