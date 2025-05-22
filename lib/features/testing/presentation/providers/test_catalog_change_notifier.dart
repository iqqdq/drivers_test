import 'package:flutter/foundation.dart';
import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/testing/domain/domain.dart';

class TestCatalogChangeNotifier with ChangeNotifier {
  List<TestEntity>? _tests;
  List<TestEntity>? get tests => _tests;

  Future getTests({required String state}) async {
    _tests = await sl.get<TestingRepository>().getTests(state: state);
    notifyListeners();
  }
}
