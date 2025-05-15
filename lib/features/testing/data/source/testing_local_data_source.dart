import 'package:drift/drift.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/testing/domain/domain.dart';

class TestingLocalDataSource {
  final AppDatabase _db;

  TestingLocalDataSource(this._db) {
    _initTests();
  }

  Future _initTests() async {
    final query = await _db.select(_db.testTable).get();
    if (query.isNotEmpty) return;

    // Создаем демонстрационные тесты
    final defaultTests = [
      TestEntity(
        category: 'Математика',
        name: 'Основы алгебры',
        questions: [
          QuestionEntity(
            question: 'Решите уравнение: 2x + 5 = 15',
            answers: ['5', '10', '7.5', '20'],
            correct: 0,
          ),
          QuestionEntity(
            question: 'Чему равен квадратный корень из 64?',
            answers: ['4', '8', '6', '10'],
            correct: 1,
          ),
        ],
      ),
      TestEntity(
        category: 'География',
        name: 'Столицы мира',
        questions: [
          QuestionEntity(
            question: 'Столица Франции?',
            answers: ['Лондон', 'Берлин', 'Париж', 'Мадрид'],
            correct: 2,
          ),
          QuestionEntity(
            question: 'Столица Японии?',
            answers: ['Пекин', 'Сеул', 'Токио', 'Бангкок'],
            correct: 2,
          ),
          QuestionEntity(
            image: 'usa_flag.png',
            question: 'Столица США?',
            answers: ['Нью-Йорк', 'Лос-Анджелес', 'Вашингтон', 'Чикаго'],
            correct: 2,
          ),
        ],
      ),
    ];

    // Вставляем тесты в базу данных
    for (final test in defaultTests) {
      await setTest(test);
    }
  }

  // Метод для получения всех тестов
  Future<List<TestEntity>> getTests(String? category) async {
    final query =
        category == null
            ? await _db.select(_db.testTable).get()
            : await (_db.select(_db.testTable)
              ..where((q) => q.category.equals(category))).get();

    final tests = await Future.wait(
      query.map((row) async {
        final questions = await getQuestionsForTest(row.category, row.name);
        return TestEntity(
          category: row.category,
          name: row.name,
          questions: questions,
        );
      }),
    );

    return tests;
  }

  // Метод для добавления теста
  Future<void> setTest(TestEntity test) async {
    await _db
        .into(_db.testTable)
        .insert(
          TestTableCompanion.insert(category: test.category, name: test.name),
        );

    await _db.batch((batch) {
      batch.insertAll(
        _db.questionTable,
        test.questions.map(
          (question) => QuestionTableCompanion.insert(
            testCategory: test.category,
            testName: test.name,
            image: Value(question.image),
            question: question.question,
            answers: question.answers,
            correct: question.correct,
            answer: Value(question.answer),
          ),
        ),
      );
    });
  }

  // Метод для получения вопросов для конкретного теста
  Future<List<QuestionEntity>> getQuestionsForTest(
    String category,
    String testName,
  ) async {
    final query = _db.select(_db.questionTable)..where(
      (q) => q.testCategory.equals(category) & q.testName.equals(testName),
    );

    final questionRows = await query.get();
    return questionRows
        .map(
          (row) => QuestionEntity(
            image: row.image,
            question: row.question,
            answers: row.answers,
            correct: row.correct,
            answer: row.answer,
          ),
        )
        .toList();
  }

  // Метод для обновления ответа на вопрос
  Future<void> updateQuestionAnswer(
    QuestionEntity question,
    String category,
    String testName,
  ) async {
    await (_db.update(_db.questionTable)..where(
      (q) =>
          q.testCategory.equals(category) &
          q.testName.equals(testName) &
          q.question.equals(question.question),
    )).write(QuestionTableCompanion(answer: Value(question.answer)));
  }
}
