import 'package:drift/drift.dart';
import 'package:drivers_test/features/features.dart';
import 'package:drivers_test/core/core.dart';

class StatisticsRepositoryImpl implements StatisticsRepository {
  StatisticsRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Future<int> getTotalPassedTests({required String state}) async {
    final tests = await getTestWithResults(state: state);
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

    final results = (await Future.wait(
      tests.map((t) async {
        return await (_db.select(_db.results)
          ..where((r) => r.testId.equals(t.id))).get();
      }),
    )).fold<List<ResultEntity>>(
      <ResultEntity>[],
      (list, results) => list..addAll(results),
    );

    final total = results.fold(0, (sum, e) => sum + e.correctAnswerAmount);
    return total;
  }

  @override
  Future<List<TestEntity>?> getTestWithResults({required String state}) async {
    final tests =
        await (_db.select(_db.tests)
          ..where((e) => e.state.equals(state))).get();
    final results = await (_db.select(_db.results)).get();
    return results
        .expand(
          (r) => tests
              .where((t) => r.testId == t.id)
              .map((t) => t.copyWith(result: r)),
        )
        .toList();
  }
}
