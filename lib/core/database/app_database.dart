import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drivers_test/features/features.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [TestTable, QuestionTable, ResultTable, SettingsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase(file);
  });
}

class CommaSeparatedConverter<T> extends TypeConverter<List<T>, String> {
  final T Function(String) parser;
  final String Function(T) serializer;

  const CommaSeparatedConverter({
    required this.parser,
    required this.serializer,
  });

  @override
  List<T> fromSql(String fromDb) {
    return fromDb.split(',').map(parser).toList();
  }

  @override
  String toSql(List<T> value) {
    return value.map(serializer).join(',');
  }
}

// Использование для int:
final intConverter = CommaSeparatedConverter<int>(
  parser: int.parse,
  serializer: (i) => i.toString(),
);

// Использование для String:
final stringConverter = CommaSeparatedConverter<String>(
  parser: (s) => s,
  serializer: (s) => s,
);
