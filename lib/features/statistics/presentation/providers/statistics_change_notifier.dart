import 'package:drivers_test/features/features.dart';
import 'package:flutter/foundation.dart';
import 'package:drivers_test/core/core.dart';

enum TestType { exam, test }

enum TestResultType { passed, failed }

class StatisticsChangeNotifier with ChangeNotifier {
  List<TestEntity>? _tests;
  List<TestEntity>? get tests => _tests;

  int _totalCorrectAnswers = 0;
  int get totalCorrectAnswers => _totalCorrectAnswers;

  int _totalQuestions = 0;
  int get totalQuestions => _totalQuestions;

  int _totalTest = 0;
  int get totalTest => _totalTest;

  int _totalCompletedTest = 0;
  int get totalCompletedTest => _totalCompletedTest;

  int _totalPassedTest = 0;
  int get totalPassedTest => _totalPassedTest;

  double get examReadiness =>
      _totalCorrectAnswers == 0 || _totalQuestions == 0
          ? 0
          : _totalCorrectAnswers / _totalQuestions;

  TestType? _testType;
  TestType? get testType => _testType;

  TestResultType? _resultType;
  TestResultType? get resultType => _resultType;

  Future _getTests() async {
    final state = (await sl.get<SettingsRepository>().getSettings())!.state!;
    _tests = await sl.get<StatisticsRepository>().getTestWithResult(
      state: state,
    );

    if (_testType != null) {
      _tests?.removeWhere(
        (e) => _testType == TestType.test ? e.isExam : !e.isExam,
      );
    }

    if (_resultType != null) {
      _tests?.removeWhere(
        (e) => _resultType == TestResultType.failed ? e.isPassed : !e.isPassed,
      );
    }

    notifyListeners();
  }

  Future getStatistics() async {
    final repository = sl.get<StatisticsRepository>();
    final state = (await sl.get<SettingsRepository>().getSettings())!.state!;

    _totalTest =
        isSubscribed.value ? await repository.getTotalTests(state: state) : 3;
    _totalCompletedTest = await repository.getTotalCompletedTests(state: state);
    _totalPassedTest = await repository.getTotalPassedTests(state: state);
    _totalQuestions = await repository.getTotalQuestions(state: state);
    _totalCorrectAnswers = await repository.getTotalCorrectAnswers(
      state: state,
    );

    _getTests();
  }

  void toogleTestType(TestType? type) {
    _testType = type;
    _getTests();
  }

  void toogleTestResultType(TestResultType? resultType) {
    _resultType = resultType;
    _getTests();
  }
}
