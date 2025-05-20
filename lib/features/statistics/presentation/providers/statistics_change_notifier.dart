import 'package:flutter/foundation.dart';
import 'package:drivers_test/features/statistics/domain/domain.dart';

class StatisticsChangeNotifier with ChangeNotifier {
  String? _category;
  String? get category => _category;

  // TestMode? _testMode;
  // TestMode? get testMode => _testMode;

  bool? _isPassed;
  bool? get isPassed => _isPassed;

  List<TestResultEntity>? _results;
  List<TestResultEntity>? get results => _results;

  // void setTestMode(TestMode testMode) async {
  //   _testMode = testMode;
  //   notifyListeners();
  //   await getTestResults();
  // }

  void toogleTestResult(bool isPassed) async {
    _isPassed = isPassed;
    notifyListeners();
    await getTestResults();
  }

  void setCategory(String category) async {
    _category = category;
    notifyListeners();
    await getTestResults();
  }

  Future getTestResults() async {
    // _results = await sl.get<TestingRepository>().getTests(category);
    // notifyListeners();
  }
}
