import 'package:drivers_test/core/core.dart';

abstract class StatisticsRepository {
  Future<int> getTotalPassedTests({required String state});
  Future<int> getTotalTests({required String state});
  Future<int> getTotalQuestions({required String state});
  Future<int> getTotalCorrectAnswers({required String state});
  Future<List<TestEntity>?> getTestWithResults({required String state});
}
