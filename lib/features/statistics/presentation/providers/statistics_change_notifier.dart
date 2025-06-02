import 'package:drivers_test/features/features.dart';
import 'package:flutter/foundation.dart';
import 'package:drivers_test/core/core.dart';

enum TestType { exam, test }

enum TestResultType { passed, failed }

class StatisticsChangeNotifier with ChangeNotifier {
  late String _state;

  List<TestEntity>? _tests;
  List<TestEntity>? get tests => _tests;

  int _totalCorrectAnswers = 0;
  int get totalCorrectAnswers => _totalCorrectAnswers;

  int _totalQuestions = 0;
  int get totalQuestions => _totalQuestions;

  int _totalPassedTest = 0;
  int get totalPassedTest => _totalPassedTest;

  int _totalTest = 0;
  int get totalTest => _totalTest;

  int _examReadiness = 0;
  int get examReadiness => _examReadiness;

  TestType? _type;
  TestType? get type => _type;

  TestResultType? _resultType;
  TestResultType? get resultType => _resultType;

  Future _getTests() async {
    _tests = await sl.get<StatisticsRepository>().getTestWithResult(
      state: _state,
    );
    if (type != null) {
      _tests?.removeWhere((e) => type == TestType.test ? e.isExam : !e.isExam);
    }
    if (resultType != null) {
      _tests?.removeWhere(
        (e) => resultType == TestResultType.failed ? e.isPassed : !e.isPassed,
      );
    }
    notifyListeners();
  }

  double progressValue(int index) {
    switch (index) {
      case 1:
        return totalPassedTest == 0.0 || totalTest == 0.0
            ? 0.0
            : totalPassedTest / totalTest;
      case 2:
        return totalCorrectAnswers == 0.0 || totalQuestions == 0.0
            ? 0.0
            : totalCorrectAnswers / totalQuestions;
      default:
        return examReadiness.toInt().toDouble();
    }
  }

  String filterValue(int index) =>
      index == 0
          ? type == null
              ? AppTitles.typeOfTest
              : type == TestType.exam
              ? AppTitles.exam
              : AppTitles.practicalTest
          : resultType == null
          ? AppTitles.testResult
          : resultType == TestResultType.passed
          ? AppTitles.passed
          : AppTitles.failed;

  Future getStatistics() async {
    _state = (await sl.get<SettingsRepository>().getSettings())!.state!;
    _totalPassedTest = await sl.get<StatisticsRepository>().getTotalPassedTests(
      state: _state,
    );
    _totalTest =
        isSubscribed.value
            ? await sl.get<StatisticsRepository>().getTotalTests(state: _state)
            : 3;
    _totalQuestions = await sl.get<StatisticsRepository>().getTotalQuestions(
      state: _state,
    );
    _totalCorrectAnswers = await sl
        .get<StatisticsRepository>()
        .getTotalCorrectAnswers(state: _state);
    _examReadiness =
        _totalCorrectAnswers == 0 ? 0 : _totalCorrectAnswers ~/ _totalQuestions;
    _getTests();
  }

  void toogleTestType(TestType? type) {
    _type = type;
    _getTests();
  }

  void toogleTestResultType(TestResultType? resultType) {
    _resultType = resultType;
    _getTests();
  }
}
