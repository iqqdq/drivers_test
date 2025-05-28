import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:drivers_test/core/core.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Tests,
    Questions,
    Results,
    Settings,
    PracticeReminders,
    ExamReminders,
  ],
)
class AppDatabase extends _$AppDatabase {
  static Future<AppDatabase> create() async {
    final db = AppDatabase._internal();
    await db._initTests();
    return db;
  }

  AppDatabase._internal() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Метод получения всех вопросов из assets
  Future<List<JsonData>> loadJsonData({String? state}) async {
    if (state != null) {
      // Загрузка данных для конкретного штата
      final json = await rootBundle.loadString('assets/json/$state.json');
      final data = jsonDecode(json);
      return [JsonData.fromJson(data)];
    } else {
      // Загрузка данных для всех штатов
      final jsonDataList = <JsonData>[];
      for (var state in states) {
        final json = await rootBundle.loadString('assets/json/$state.json');
        final data = jsonDecode(json);
        jsonDataList.add(JsonData.fromJson(data));
      }
      return jsonDataList;
    }
  }

  Future _initTests() async {
    // Проверяем, присутствуют ли тесты в базе данных, если да - выходим
    final query = await select(tests).get();
    if (query.isNotEmpty) return;
    // Получаем все вопросы из assets
    final jsonDataList = await loadJsonData();

    for (final jsonData in jsonDataList) {
      // Сохраняем вопросы для каждого штата в базу данных
      for (final question in jsonData.questions) {
        await into(questions).insert(
          QuestionsCompanion.insert(
            state: jsonData.state,
            image: Value(question.image),
            question: question.question,
            choices: question.choices,
            correct: question.correct,
          ),
        );
      }

      // Сохраняем 30 тестов для каждого штата в базу данных
      final int limit = 30;
      for (var i = 0; i < limit; i++) {
        await into(tests).insert(
          TestsCompanion.insert(
            state: jsonData.state,
            questionIds: await getRandomUniqueQuestionIds(),
            minPassRatio: jsonData.min / jsonData.max,
          ),
        );
      }
    }
  }

  // Метод получения списка id тридцати случайных вопросов штата
  Future<List<int>> getRandomUniqueQuestionIds({int limit = 30}) async {
    // Создаем подзапрос для получения уникальных id
    final query =
        selectOnly(questions)
          ..addColumns([questions.id])
          ..groupBy([questions.id])
          ..orderBy([
            OrderingTerm(expression: FunctionCallExpression('RANDOM', [])),
          ])
          ..limit(limit);
    // Выполняем запрос и преобразуем результат
    final result = await query.map((row) => row.read(questions.id)!).get();
    return result;
  }
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
