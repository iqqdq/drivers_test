import 'package:drivers_test/core/core.dart';

abstract interface class StatisticsRepository {
  Future<int> getTotalTests({required String state});
  Future<List<TestEntity>?> getTestWithResult({required String state});
  Future<int> getTotalPassedTests({required String state});
  Future<int> getTotalCompletedTests({required String state});
  Future<int> getTotalQuestions({required String state});
  Future<int> getTotalCorrectAnswers({required String state});
}
