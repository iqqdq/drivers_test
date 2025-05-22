import 'package:drivers_test/features/testing/data/data.dart';
import 'package:drivers_test/features/testing/domain/domain.dart';

class TestingRepositoryImpl implements TestingRepository {
  final TestingLocalDataSource localDataSource;

  TestingRepositoryImpl(this.localDataSource);

  @override
  Future<List<TestEntity>> getTests({required String state}) async =>
      await localDataSource.getTests(state: state);

  @override
  Future<List<QuestionEntity>> getQuestions({required int testId}) async =>
      await localDataSource.getQuestions(id: testId);

  @override
  Future<List<ResultEntity>?> getResults() async =>
      await localDataSource.getResults();

  @override
  Future<ResultEntity> getResult({required int testId}) async =>
      await localDataSource.getResult(id: testId);

  @override
  Future<int?> getResultBestTime({required int testId}) async =>
      await localDataSource.getResultBestTime(id: testId);

  @override
  Future saveResult({
    required int id,
    required List<int> answers,
    required int durationInSeconds,
    required DateTime completedAt,
  }) async => await localDataSource.saveResult(
    id: id,
    answers: answers,
    durationInSeconds: durationInSeconds,
    completedAt: completedAt,
  );
}
