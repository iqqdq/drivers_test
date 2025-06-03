import 'dart:async';

import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/testing/domain/domain.dart';
import 'package:flutter/material.dart';

class TestChangeNotifier with ChangeNotifier {
  final TestEntity test;
  final List<int>? answers;

  TestChangeNotifier({required this.test, this.answers});

  late Timer _timer;

  Duration? _duration;
  Duration? get duration => _duration;

  List<QuestionEntity>? _questions;
  List<QuestionEntity>? get questions => _questions;

  bool get isTimeUp => !_timer.isActive;

  bool get isTestCompleted =>
      _questions == null
          ? false
          : _questions!.any((e) => e.answer == null)
          ? false
          : true;

  int _index = 0;
  int get index => _index;

  @override
  void dispose() {
    if (answers == null) {
      _timer.cancel();
    }
    super.dispose();
  }

  void _startTimer() {
    _duration =
        test.isExam
            ? Duration(minutes: test.questionIds.length)
            : Duration.zero;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (test.isExam) {
        _duration!.inSeconds > 0 || !isTestCompleted
            ? _duration = _duration! - Duration(seconds: 1)
            : timer.cancel();
      } else {
        _duration!.inSeconds < 86400 || !isTestCompleted
            ? _duration = _duration! + Duration(seconds: 1)
            : timer.cancel();
      }
      notifyListeners();
    });
  }

  void getQuestions() async {
    _questions = await sl.get<TestingRepository>().getQuestions(
      testId: test.id,
    );

    if (answers == null) {
      _startTimer();
    } else {
      for (int i = 0; i < questions!.length; i++) {
        if (i < answers!.length) {
          questions![i].answer = answers![i];
        }
      }
      notifyListeners();
    }
  }

  void updateQuestion(QuestionEntity question) {
    final index = _questions!.indexWhere((e) => e.id == question.id);
    _questions![index] = question;
    if (isTestCompleted) _timer.cancel();
    notifyListeners();
  }

  void selectQuestion(int index) {
    _index = index;
    notifyListeners();
  }

  Future saveResult() async {
    final answers = questions!.map((e) => e.answer!).toList();
    await sl.get<TestingRepository>().saveResult(
      id: test.id,
      answers: answers,
      durationInSeconds: _duration!.inSeconds,
      completedAt: DateTime.now(),
    );
  }
}
