import 'dart:async';

import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/testing/domain/domain.dart';
import 'package:flutter/material.dart';

enum TestMode { practice, exam }

class TestPageChangeNotifier with ChangeNotifier {
  final TestEntity test;

  TestPageChangeNotifier({required this.test});

  late Timer _timer;

  late Duration _duration;
  Duration get duration => _duration;

  TestMode _testMode = TestMode.practice;
  TestMode get testMode => _testMode;

  List<QuestionEntity>? _questions;
  List<QuestionEntity>? get questions => _questions;

  bool get isTimeUp => !_timer.isActive;
  bool get isTestCompleted => false;
  // _test == null
  //     ? false
  //     : _test!.am.any((e) => e.answer == null)
  //     ? false
  //     : true; TODO

  int _index = 0;
  int get index => _index;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // void setTestMode(TestMode testMode) => _testMode = testMode; // TODO DELETE?

  void getQuestions() async {
    _questions = await sl.get<TestingRepository>().getQuestions(
      state: test.state,
      testId: test.id,
    );

    _startTimer();
  }

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

  void setQuestion(QuestionEntity question) {
    final index = _questions!.indexWhere(
      (e) => e.question == question.question,
    );
    _questions![index] = question;

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
