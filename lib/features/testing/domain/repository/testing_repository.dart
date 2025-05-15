import 'package:drivers_test/features/testing/domain/domain.dart';

abstract interface class TestingRepository {
  Future<List<TestEntity>?> getTests(String? category);
  Future saveTest({required TestEntity test});
}
