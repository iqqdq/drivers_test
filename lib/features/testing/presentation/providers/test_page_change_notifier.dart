import 'dart:async';

import 'package:drivers_test/features/testing/domain/domain.dart';
import 'package:flutter/material.dart';

enum TestMode { practice, exam }

class TestPageChangeNotifier with ChangeNotifier {
  late Timer _timer;

  late Duration _duration;
  Duration get duration => _duration;

  TestMode _testMode = TestMode.practice;
  TestMode get testMode => _testMode;

  TestEntity? _test;
  TestEntity? get test => _test;

  bool get isTimeUp => !_timer.isActive;
  bool get isTestCompleted =>
      _test == null
          ? false
          : _test!.questions.any((e) => e.answer == null)
          ? false
          : true;

  int _index = 0;
  int get index => _index;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void setTestMode(TestMode testMode) => _testMode = testMode;

  void _startTimer() {
    _duration =
        _testMode == TestMode.practice ? Duration.zero : Duration(minutes: 30);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_testMode == TestMode.practice) {
        _duration.inSeconds < 86400 || !isTestCompleted
            ? _duration = _duration + Duration(seconds: 1)
            : timer.cancel();
      } else {
        _duration.inSeconds > 0 || !isTestCompleted
            ? _duration = _duration - Duration(seconds: 1)
            : timer.cancel();
      }

      notifyListeners();
    });
  }

  void setTest(TestEntity test) {
    Future.delayed(Duration(seconds: 1), () => _test = test);
    _startTimer();
  }

  void setQuestion(QuestionEntity question) {
    final index = _test!.questions.indexWhere(
      (e) => e.question == question.question,
    );

    _test!.questions[index] = question;

    if (isTestCompleted) _timer.cancel();
    notifyListeners();
  }

  void selectQuestion(int index) {
    _index = index;
    notifyListeners();
  }

  Future saveTest() async {
    // TODO SAVE TEST TO LOCAL STORAGE
  }
}
