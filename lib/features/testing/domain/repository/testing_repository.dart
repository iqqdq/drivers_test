import 'package:drivers_test/features/testing/domain/domain.dart';

abstract interface class TestingRepository {
  Future<List<TestEntity>> getTests(String state);
  Future<List<QuestionEntity>> getQuestions({
    required String state,
    required int testId,
  });

  // Future saveTest({required TestEntity test}); // TODO DELETE?
}
