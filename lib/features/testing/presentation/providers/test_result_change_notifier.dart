import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';

class TestResultChangeNotifier with ChangeNotifier {
  final TestEntity test;
  TestResultChangeNotifier({required this.test});

  ResultEntity? _result;
  ResultEntity? get result => _result;

  int? _bestTime;
  int? get bestTime => _bestTime;

  void getResult() async {
    _result = await sl.get<TestingRepository>().getResult(testId: test.id);
    _bestTime = await sl.get<TestingRepository>().getResultBestTime(
      testId: test.id,
    );
    notifyListeners();
  }
}
