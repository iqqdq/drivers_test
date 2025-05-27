import 'package:drivers_test/core/core.dart';

abstract interface class HomeRepository {
  Future<TestEntity> initExam({required String state});
}
