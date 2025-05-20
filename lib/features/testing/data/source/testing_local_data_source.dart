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

  Future<List<JsonData>> _loadJsonData() async {
    final jsonDataList = <JsonData>[];
    for (var state in states) {
      final json = await rootBundle.loadString('assets/json/$state.json');
      final data = jsonDecode(json);
      jsonDataList.add(JsonData.fromJson(data));
    }
    return jsonDataList;
  }

  List<JsonQuestion> _loadJsonQuestions(JsonData jsonData, {int limit = 30}) {
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
    // Проверяем, присутствуют ли тесты в бд, если да - выходим
    final query = await _db.select(_db.testTable).get();
    if (query.isNotEmpty) return;

    // Подгружаем вопросы из каталога конкретного штата
    final jsonDataList = await _loadJsonData();

    // Сохраняем тесты в базу данных
    for (final jsonData in jsonDataList) {
      int count = 0;
      int total = 30;

      // Запоняем 30 тестов c 30 вопросами
      while (count < total) {
        // Инициализируем тест
        final test = TestEntity(
          id: count,
          state: jsonData.state,
          name: 'Practical test',
          amount: total,
        );
        // Инициализируем 30 случайных вопросов из каталога конкретного штата
        final jsonQuestions = _loadJsonQuestions(jsonData);
        final questions = <QuestionEntity>[];

        // Заполняем вопросы
        for (var jsonQuestion in jsonQuestions) {
          questions.add(
            QuestionEntity(
              state: test.state,
              testId: count,
              id: jsonQuestion.id,
              image: jsonQuestion.image,
              question: jsonQuestion.question,
              choices: jsonQuestion.choices,
              correct: jsonQuestion.correct,
            ),
          );
        }

        // Сохраняем тест в бд
        await setTest(test, questions);
        count++;
      }
    }
  }

  // Метод для получения всех тестов штата
  Future<List<TestEntity>> getTests(String state) async {
    final query = _db.select(_db.testTable)
      ..where((q) => q.state.equals(state));
    final tests = await query.get();
    return tests;
  }

  // Метод для добавления теста
  Future<void> setTest(TestEntity test, List<QuestionEntity> questions) async {
    await _db
        .into(_db.testTable)
        .insert(
          TestTableCompanion.insert(
            id: test.id,
            state: test.state,
            name: test.name,
            amount: test.amount,
            result: Value(test.result),
          ),
        );

    await _db.batch((batch) {
      batch.insertAll(
        _db.questionTable,
        questions.map(
          (e) => QuestionTableCompanion.insert(
            state: e.state,
            testId: e.testId,
            id: e.id,
            image: Value(e.image),
            question: e.question,
            choices: e.choices,
            correct: e.correct,
            answer: Value(e.answer),
          ),
        ),
      );
    });
  }

  // Метод для получения вопросов для конкретного теста
  Future<List<QuestionEntity>> getQuestionsForTest(
    String state,
    int testId,
  ) async {
    final query = _db.select(_db.questionTable)
      ..where((q) => q.state.equals(state) & q.testId.equals(testId));
    final questions = await query.get();
    return questions;
  }

  // Метод для обновления ответа на вопрос
  // Future<void> updateQuestionAnswer( // TODO DELETE?
  //   QuestionEntity question,
  //   String category,
  //   String testName,
  // ) async {
  //   await (_db.update(_db.questionTable)..where(
  //     (q) =>
  //         q.testCategory.equals(category) &
  //         q.testName.equals(testName) &
  //         q.question.equals(question.question),
  //   )).write(QuestionTableCompanion(answer: Value(question.answer)));
  // }
}
