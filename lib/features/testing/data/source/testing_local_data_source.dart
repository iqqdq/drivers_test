import 'dart:convert';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';

class TestingLocalDataSource {
  final AppDatabase _db;

  TestingLocalDataSource(this._db) {
    _initTests();
  }

  // Метод получения всех вопросов из assets
  Future<List<JsonData>> _loadJsonData() async {
    final jsonDataList = <JsonData>[];
    for (var state in states) {
      final json = await rootBundle.loadString('assets/json/$state.json');
      final data = jsonDecode(json);
      jsonDataList.add(JsonData.fromJson(data));
    }
    return jsonDataList;
  }

  // Метод генерации 30 вопросов штата
  List<JsonQuestion> _loadJsonQuestions(JsonData jsonData, int limit) {
    // Создаем временный Set для хранения уникальных id
    final Set<int> idSet = {};
    final random = Random();
    // Фильтруем вопросы, оставляя только уникальные по id
    final uniqueQuestions =
        jsonData.questions.where((question) {
          if (idSet.contains(question.id)) {
            return false; // Пропускаем дубликаты
          } else {
            idSet.add(question.id); // Запоминаем id
            return true;
          }
        }).toList();

    // Если уникальных вопросов меньше или равно limit, возвращаем все
    if (uniqueQuestions.length <= limit) {
      return uniqueQuestions;
    }

    // Создаем список для результатов
    final result = <JsonQuestion>[];
    // Создаем копию списка, чтобы не изменять оригинал
    final remainingQuestions = List<JsonQuestion>.from(uniqueQuestions);

    // Выбираем случайные вопросы, пока не наберем нужное количество
    while (result.length < limit && remainingQuestions.isNotEmpty) {
      // Генерируем случайный индекс в пределах оставшихся вопросов
      final randomIndex = random.nextInt(remainingQuestions.length);
      // Добавляем выбранный вопрос в результат
      result.add(remainingQuestions[randomIndex]);
      // Удаляем выбранный вопрос из оставшихся
      remainingQuestions.removeAt(randomIndex);
    }

    return result;
  }

  Future _initTests() async {
    // Проверяем, присутствуют ли тесты в базе данных, если да - выходим
    final query = await _db.select(_db.testTable).get();
    if (query.isNotEmpty) return;
    // Получаем все вопросы из assets
    final jsonDataList = await _loadJsonData();
    final total = 30;

    // Сохраняем тесты в базу данных (30 тестов по 30 вопросов для каждого штата)
    for (final jsonData in jsonDataList) {
      for (var i = 0; i < total; i++) {
        // Сохраняем тест
        final id = await _db
            .into(_db.testTable)
            .insert(
              TestTableCompanion.insert(
                state: jsonData.state,
                name: 'Practical test',
                amount: total,
              ),
            );

        // Сохраняем вопросы для теста
        for (var jsonQuestion in _loadJsonQuestions(jsonData, total)) {
          await _db
              .into(_db.questionTable)
              .insert(
                QuestionTableCompanion.insert(
                  testId: id,
                  image: Value(jsonQuestion.image),
                  question: jsonQuestion.question,
                  choices: jsonQuestion.choices,
                  correct: jsonQuestion.correct,
                ),
              );
        }
      }
    }
  }

  // Метод получения всех тестов штата
  Future<List<TestEntity>> getTests({required String state}) async {
    final query = _db.select(_db.testTable)
      ..where((e) => e.state.equals(state));
    final tests = await query.get();

    // Для каждого теста получаем количество правильных ответов
    for (var test in tests) {
      final query =
          _db.select(_db.resultTable)
            ..where((e) => e.testId.equals(test.id))
            ..orderBy([
              (e) =>
                  OrderingTerm(expression: e.correct, mode: OrderingMode.desc),
            ])
            ..limit(1);
      final result = await query.getSingleOrNull();
      test.result = result?.correct;
    }

    return tests;
  }

  // Метод получения вопросов
  Future<List<QuestionEntity>> getQuestions({required int id}) async {
    final query = _db.select(_db.questionTable)
      ..where((e) => e.testId.equals(id));
    final questions = await query.get();
    return questions;
  }

  // Метод сохранения результата
  Future saveResult({
    required int id,
    required List<int> answers,
    required int durationInSeconds,
    required DateTime completedAt,
  }) async {
    final test =
        await (_db.select(_db.testTable)
          ..where((e) => e.id.equals(id))).getSingle();
    final questions =
        await (_db.select(_db.questionTable)
          ..where((e) => e.testId.equals(id))).get();
    final correct =
        List.generate(
          questions.length,
          (i) => questions[i].correct == answers[i],
        ).where((b) => b).length;

    return await _db
        .into(_db.resultTable)
        .insertReturning(
          ResultTableCompanion.insert(
            testId: test.id,
            testName: test.name,
            testAmount: test.amount,
            answers: answers,
            correct: correct,
            durationInSeconds: durationInSeconds,
            completedAt: completedAt,
          ),
        );
  }

  // Метод получения наименьшего времени прохождения теста
  Future<int?> getResultBestTime({required int id}) async {
    final query =
        _db.select(_db.resultTable)
          ..where((e) => e.testId.equals(id))
          ..orderBy([
            (e) => OrderingTerm(
              expression: e.durationInSeconds,
              mode: OrderingMode.asc,
            ),
          ])
          ..limit(1);
    final result = await query.getSingleOrNull();
    return result?.durationInSeconds;
  }

  // Метод получения всех результатов
  Future<List<ResultEntity>?> getResults() async {
    final query = _db.select(_db.resultTable);
    final results = await query.get();
    return results;
  }

  // Метод получения последнего результата
  Future<ResultEntity> getResult({required int id}) async {
    final query =
        _db.select(_db.resultTable)
          ..where((e) => e.testId.equals(id))
          ..orderBy([(t) => OrderingTerm.desc(t.completedAt)])
          ..limit(1);
    final result = await query.getSingle();
    return result;
  }
}
