import 'package:drivers_test/core/di/di.dart';
import 'package:drivers_test/features/testing/testing.dart';
import 'package:flutter/foundation.dart';

class StatisticsChangeNotifier with ChangeNotifier {
  String? _category;
  String? get category => _category;

  // TestMode? _testMode;
  // TestMode? get testMode => _testMode;

  bool? _isPassed;
  bool? get isPassed => _isPassed;

  List<ResultEntity>? _results;
  List<ResultEntity>? get results => _results;

  // void setTestMode(TestMode testMode) async {
  //   _testMode = testMode;
  //   notifyListeners();
  //   await getTestResults();
  // }

  Future getResults() async {
    _results = await sl.get<TestingRepository>().getResults();
    notifyListeners();
  }

  void toogleTestResult(bool isPassed) async {
    _isPassed = isPassed;
    notifyListeners();
    await getResults();
  }

  void setCategory(String category) async {
    _category = category;
    notifyListeners();
    await getResults();
  }

  Future<TestEntity> getTest({required int resultId}) async =>
      await sl.get<TestingRepository>().getTest(id: resultId);
}
