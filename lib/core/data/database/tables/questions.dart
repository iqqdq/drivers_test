import 'package:drift/drift.dart';
import 'package:drivers_test/core/core.dart';

@UseRowClass(QuestionEntity, constructor: 'fromRow')
class Questions extends Table {
  TextColumn get state => text()();
  IntColumn get id => integer().autoIncrement()();
  TextColumn get image => text().nullable()();
  TextColumn get question => text()();
  TextColumn get choices => text().map(stringConverter)();
  IntColumn get correct => integer()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {state, id},
  ];
}
