import 'package:drivers_test/features/testing/data/data.dart';
import 'package:drivers_test/features/testing/domain/domain.dart';

class TestingRepositoryImpl implements TestingRepository {
  final TestingLocalDataSource localDataSource;

  TestingRepositoryImpl(this.localDataSource);

  @override
  Future<List<TestEntity>?> getTests(String? category) async =>
      await localDataSource.getTests(category);

  @override
  Future saveTest({required TestEntity test}) async =>
      await localDataSource.setTest(test);
}
