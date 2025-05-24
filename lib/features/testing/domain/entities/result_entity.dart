class ResultEntity {
  final int testId;
  final String testName;
  final int testAmount;
  final int id;
  final List<int> answers;
  final int correct;
  final int durationInSeconds;
  final DateTime completedAt;

  ResultEntity({
    required this.testId,
    required this.testName,
    required this.testAmount,
    required this.id,
    required this.answers,
    required this.correct,
    required this.durationInSeconds,
    required this.completedAt,
  });

  factory ResultEntity.fromRow({
    required int testId,
    required String testName,
    required int testAmount,
    required int id,
    required List<int> answers,
    required int correct,
    required int durationInSeconds,
    required DateTime completedAt,
  }) => ResultEntity(
    testId: testId,
    testName: testName,
    testAmount: testAmount,
    id: id,
    answers: answers,
    correct: correct,
    durationInSeconds: durationInSeconds,
    completedAt: completedAt,
  );

  bool get isExam => testName.toLowerCase() == 'exam';
  int get accuracy => ((correct / testAmount) * 100).toInt();
  bool get isPassed => accuracy >= 90; // TODO REPLACE 90 FROM JSONDATA
}
