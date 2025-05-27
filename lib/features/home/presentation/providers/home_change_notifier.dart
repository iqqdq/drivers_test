import 'package:drivers_test/features/features.dart';
import 'package:flutter/foundation.dart';
import 'package:drivers_test/core/core.dart';

class HomeChangeNotifier with ChangeNotifier {
  HomeChangeNotifier();

  TestEntity? _test;
  TestEntity? get test => _test;

  int get examQuestionAmount => test?.questionIds.length ?? 0;

  int get correctAnswersToPass =>
      ((test?.minPassRatio ?? 0.0) * examQuestionAmount).toInt();

  int get passingScore => ((test?.minPassRatio ?? 0.0) * 100).toInt();

  Future getExam() async {
    final state = (await sl.get<SettingsRepository>().getSettings())!.state!;
    _test = await sl.get<HomeRepository>().initExam(state: state);
  }
}
