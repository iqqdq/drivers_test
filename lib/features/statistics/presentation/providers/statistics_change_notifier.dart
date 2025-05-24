import 'package:drivers_test/core/di/di.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/foundation.dart';

enum TestType { exam, test }

enum TestResultType { passed, failed }

class StatisticsChangeNotifier with ChangeNotifier {
  List<ResultEntity>? _results;
  List<ResultEntity>? get results => _results;

  int _totalCorrect = 0;
  int get totalCorrect => _totalCorrect;

  int _totalAmount = 0;
  int get totalAmount => _totalAmount;

  int _totalPassedTest = 0;
  int get totalPassedTest => _totalPassedTest;

  double _examReadiness = 0.0;
  double get examReadiness => _examReadiness;

  TestType? _type;
  TestType? get type => _type;

  TestResultType? _resultType;
  TestResultType? get resultType => _resultType;

  Future _getPassedTests() async {
    final state = (await sl.get<SettingsRepository>().getSettings())!.state!;

    _totalPassedTest = await sl.get<TestingRepository>().getTotalPassed(
      state: state,
    );

    _totalCorrect = await sl.get<TestingRepository>().getTotalCorrect(
      state: state,
    );
    _totalAmount = await sl.get<TestingRepository>().getTotalAmount(
      state: state,
    );

    // _examReadiness = _totalCorrect == 0 ? 0.0 : _totalCorrect / _totalAmount;
    notifyListeners();
  }

  Future getResults() async {
    _results = await sl.get<TestingRepository>().getResults();
    _getPassedTests();
  }

  void toogleTestType(TestType? type) {
    _type = type;

    if (_type == null) {
      getResults();
    } else {
      final isExam = _type == TestType.test;
      _results!.removeWhere((e) => e.isExam == isExam);
      notifyListeners();
    }
  }

  void toogleTestResultType(TestResultType? resultType) {
    _resultType = resultType;

    if (resultType == null) {
      getResults();
    } else {
      final isPassed = resultType == TestResultType.failed;
      _results!.removeWhere((e) => e.isPassed == isPassed);
      notifyListeners();
    }
  }

  // Future<TestEntity> getTest({required int resultId}) async =>
  // await sl.get<TestingRepository>().getTest(id: resultId);
}
