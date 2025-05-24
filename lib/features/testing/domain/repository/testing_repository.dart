import 'package:drivers_test/features/testing/domain/domain.dart';

abstract interface class TestingRepository {
  // TEST
  Future<List<TestEntity>> getTests({required String state});
  Future<List<QuestionEntity>> getQuestions({required int testId});
  // TEST RESULT
  Future saveResult({
    required int id,
    required List<int> answers,
    required int durationInSeconds,
    required DateTime completedAt,
  });
  Future<ResultEntity> getResult({required int testId});
  Future<List<ResultEntity>?> getResults();
  Future<int?> getResultBestTime({required int testId});
  // STATISTIC'S
  Future<int> getTotalPassed({required String state});
  Future<int> getTotalAmount({required String state});
  Future<int> getTotalCorrect({required String state});
}
