import 'package:drivers_test/features/testing/data/data.dart';
import 'package:drivers_test/features/testing/domain/domain.dart';

class TestingRepositoryImpl implements TestingRepository {
  final TestingLocalDataSource localDataSource;

  TestingRepositoryImpl(this.localDataSource);

  @override
  Future<List<TestEntity>> getTests(state) async =>
      await localDataSource.getTests(state);

  @override
  Future<List<QuestionEntity>> getQuestions({
    required String state,
    required int testId,
  }) async => await localDataSource.getQuestionsForTest(state, testId);

  // @override
  // Future saveTest({required TestEntity test}) async =>
  //     await localDataSource.setTest(test); // TODO DELETE?
}
