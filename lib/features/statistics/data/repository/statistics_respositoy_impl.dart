import 'package:drift/drift.dart';
import 'package:drivers_test/features/features.dart';
import 'package:drivers_test/core/core.dart';

class StatisticsRepositoryImpl implements StatisticsRepository {
  StatisticsRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Future<int> getTotalPassedTests({required String state}) async {
    final tests = await getTestWithResult(state: state);
    tests?.removeWhere((e) => e.isExam);
    tests?.removeWhere((e) => !e.isPassed);
    return tests?.length ?? 0;
  }

  @override
  Future<int> getTotalTests({required String state}) async {
    final tests =
        await (_db.select(_db.tests)..where(
          (e) => e.state.equals(state) & e.isExam.isNotValue(true),
        )).get();
    return tests.length;
  }

  @override
  Future<int> getTotalQuestions({required String state}) async {
    final tests =
        await (_db.select(_db.tests)..where(
          (e) => e.state.equals(state) & e.isExam.isNotValue(true),
        )).get();
    final total = tests.fold(0, (sum, e) => sum + e.questionIds.length);
    return total;
  }

  @override
  Future<int> getTotalCorrectAnswers({required String state}) async {
    final tests =
        await (_db.select(_db.tests)..where(
          (e) => e.state.equals(state) & e.isExam.isNotValue(true),
        )).get();
    // Получаем результаты всех тестов штата
    final List<List<ResultEntity>> resultsList = await Future.wait(
      tests.map((t) async {
        return await (_db.select(_db.results)
          ..where((r) => r.testId.equals(t.id))).get();
      }),
    );
    // Объединяем все результаты в один список
    final List<ResultEntity> results =
        resultsList.expand((results) => results).toList();
    // Убираем дубликаты c наименьшим кол-вом правильных ответов
    final uniqueResults =
        results
            .fold<Map<int, ResultEntity>>(
              {},
              (map, result) =>
                  map..update(
                    result.testId,
                    (existing) =>
                        result.correctAnswerAmount >
                                existing.correctAnswerAmount
                            ? result
                            : existing,
                    ifAbsent: () => result,
                  ),
            )
            .values
            .toList();
    // Суммируем правильные ответы из каждого результата
    final totalCorrectAnswers = uniqueResults.fold(
      0,
      (sum, e) => sum + e.correctAnswerAmount,
    );
    return totalCorrectAnswers;
  }

  @override
  Future<List<TestEntity>?> getTestWithResult({required String state}) async {
    final tests =
        await (_db.select(_db.tests)
          ..where((e) => e.state.equals(state))).get();
    final results = await (_db.select(_db.results)).get();
    // Заполняем тесты результатами
    final testsWithResult =
        results.isEmpty
            ? null
            : results
                .expand(
                  (r) => tests
                      .where((t) => r.testId == t.id)
                      .map((t) => t.copyWith(result: r)),
                )
                .toList();
    return testsWithResult;
  }
}
