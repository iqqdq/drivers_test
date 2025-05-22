import 'package:drivers_test/features/testing/domain/domain.dart';

abstract interface class TestingRepository {
  Future<List<TestEntity>> getTests({required String state});
  Future<List<QuestionEntity>> getQuestions({required int testId});
  Future<List<ResultEntity>?> getResults();
  Future<ResultEntity> getResult({required int testId});
  Future<int?> getResultBestTime({required int testId});
  Future saveResult({
    required int id,
    required List<int> answers,
    required int durationInSeconds,
    required DateTime completedAt,
  });
}
