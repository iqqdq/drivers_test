import 'package:drift/drift.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/statistics/domain/domain.dart';

class StatisticsLocalDataSource {
  final AppDatabase _db;

  StatisticsLocalDataSource(this._db);

  // Метод для получения результатов пройденных тестов
  // Future<List<TestResultEntity>> getTestResults({
  //   required String? category,
  //   required bool? isExam,
  //   required bool? isPassed,
  // }) async {
  //   final query =
  //       category == null
  //           ? await _db.select(_db.testResultTable).get()
  //           : await (_db.select(_db.testResultTable)..where(
  //             (q) => q.isExam.equals(isExam) & q.isPassed.equals(isPassed),
  //           )).get();

  //   final tests = await Future.wait(
  //     query.map((row) async {
  //       final questions = await getQuestionsForTest(row.category, row.name);
  //       return TestEntity(
  //         category: row.category,
  //         name: row.name,
  //         questions: questions,
  //       );
  //     }),
  //   );

  //   return tests;
  // }
}
