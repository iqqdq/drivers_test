import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';
import 'package:flutter/material.dart';

class TestResultChangeNotifier with ChangeNotifier {
  TestResultChangeNotifier({required this.test});

  final TestEntity test;

  int? _bestTime;
  int? get bestTime => _bestTime;

  void getResult() async {
    test.result = await sl.get<TestingRepository>().getResult(testId: test.id);
    _bestTime = await sl.get<TestingRepository>().getResultBestTime(
      testId: test.id,
    );
    notifyListeners();
  }
}
