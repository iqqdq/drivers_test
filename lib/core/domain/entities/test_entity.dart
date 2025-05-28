import 'package:drivers_test/core/core.dart';
import 'package:drivers_test/features/features.dart';

class TestEntity {
  final String state;
  final int id;
  final bool isExam;
  final List<int> questionIds;
  final double minPassRatio;
  ResultEntity? result;

  TestEntity({
    required this.state,
    required this.id,
    required this.isExam,
    required this.questionIds,
    required this.minPassRatio,
    this.result,
  });

  factory TestEntity.fromRow({
    required String state,
    required int id,
    required bool isExam,
    required List<int> questionIds,
    required double minPassRatio,
  }) => TestEntity(
    state: state,
    id: id,
    isExam: isExam,
    questionIds: questionIds,
    minPassRatio: minPassRatio,
  );

  TestEntity copyWith({ResultEntity? result}) => TestEntity(
    state: state,
    id: id,
    isExam: isExam,
    questionIds: questionIds,
    minPassRatio: minPassRatio,
    result: result,
  );

  String get name => isExam ? AppTitles.exam : AppTitles.practicalTest;
  double? get passRatio =>
      result == null ? null : result!.correctAnswerAmount / questionIds.length;
  int? get accuracy => passRatio == null ? null : (passRatio! * 100).toInt();
  bool get isPassed => passRatio == null ? false : passRatio! >= minPassRatio;
}
