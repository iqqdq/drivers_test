import 'package:drivers_test/features/testing/domain/domain.dart';

class TestScreenRouteArgs {
  final TestEntity test;
  final List<int>? answers;

  TestScreenRouteArgs({required this.test, this.answers});
}
