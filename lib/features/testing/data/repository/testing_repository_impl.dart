import 'package:drift/drift.dart';
import 'package:drivers_test/features/features.dart';
import 'package:drivers_test/core/core.dart';

class TestingRepositoryImpl implements TestingRepository {
  TestingRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Future<TestEntity> initExam({required String state}) async {
    // Загружаем данные из assets
    final jsonData = await _db.loadJsonData(state: state);
    // Получаем новые вопросы штата
    final questionIds = await _db.getRandomUniqueQuestionIds(
      limit: jsonData.first.max,
    );
    // Проверяем, если экзамен для штата уже есть в бд, тогда перезаписываем его с новыми вопросами
    final query =
        await (_db.select(_db.tests)
          ..where((e) => e.state.equals(state) & e.isExam)).getSingleOrNull();
    late final int id;

    if (query == null) {
      id = await _db
          .into(_db.tests)
          .insert(
            TestsCompanion.insert(
              state: state,
              isExam: Value(true),
              questionIds: questionIds,
              minPassRatio: jsonData.first.min / jsonData.first.max,
            ),
          );
    } else {
      id = query.id;
      await _db
          .into(_db.tests)
          .insertOnConflictUpdate(
            TestsCompanion.insert(
              id: Value(query.id),
              state: state,
              isExam: Value(true),
              questionIds: questionIds,
              minPassRatio: jsonData.first.min / jsonData.first.max,
            ),
          );
    }

    final exam =
        await (_db.select(_db.tests)
          ..where((e) => e.id.equals(id))).getSingle();
    return exam;
  }

  // Метод получения всех тестов штата
  @override
  Future<List<TestEntity>> getTests({required String state}) async {
    final tests =
        await (_db.select(_db.tests)
          ..where((e) => e.state.equals(state) & e.isExam.equals(false))).get();
    // Для каждого теста получаем количество правильных ответов
    for (var test in tests) {
      final result =
          await (_db.select(_db.results)
                ..where((e) => e.testId.equals(test.id))
                ..orderBy([
                  (e) => OrderingTerm(
                    expression: e.correctAnswerAmount,
                    mode: OrderingMode.desc,
                  ),
                ])
                ..limit(1))
              .getSingleOrNull();
      test.result = result;
    }

    return tests;
  }

  // Метод получения вопросов теста
  @override
  Future<List<QuestionEntity>> getQuestions({required int testId}) async {
    final test =
        await (_db.select(_db.tests)
          ..where((e) => e.id.equals(testId))).getSingle();
    final questions =
        await (_db.select(_db.questions)
          ..where((e) => e.id.isIn(test.questionIds))).get();
    return questions;
  }

  // Метод сохранения результата
  @override
  Future saveResult({
    required int id,
    required List<int> answers,
    required int durationInSeconds,
    required DateTime completedAt,
  }) async {
    final questions = await getQuestions(testId: id);
    final correctAnswerAmount =
        List.generate(
          questions.length,
          (i) => questions[i].correct == answers[i],
        ).where((b) => b).length;

    return await _db
        .into(_db.results)
        .insertReturning(
          ResultsCompanion.insert(
            testId: id,
            answers: answers,
            correctAnswerAmount: correctAnswerAmount,
            durationInSeconds: durationInSeconds,
            completedAt: completedAt,
          ),
        );
  }

  // Метод получения лучшего времени прохождения теста
  @override
  Future<int?> getResultBestTime({required int testId}) async {
    final query =
        _db.select(_db.results)
          ..where((e) => e.testId.equals(testId))
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

  // Метод получения последнего результата
  @override
  Future<ResultEntity> getResult({required int testId}) async {
    final query =
        _db.select(_db.results)
          ..where((e) => e.testId.equals(testId))
          ..orderBy([(t) => OrderingTerm.desc(t.completedAt)])
          ..limit(1);
    return await query.getSingle();
  }
}
