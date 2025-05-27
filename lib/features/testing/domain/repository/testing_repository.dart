import 'package:drivers_test/core/core.dart';

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
  Future<int?> getResultBestTime({required int testId});
}
