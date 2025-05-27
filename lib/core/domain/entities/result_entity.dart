class ResultEntity {
  final int testId;
  final int id;
  final List<int> answers;
  final int correctAnswerAmount;
  final int durationInSeconds;
  final DateTime completedAt;

  ResultEntity({
    required this.testId,
    required this.id,
    required this.answers,
    required this.correctAnswerAmount,
    required this.durationInSeconds,
    required this.completedAt,
  });

  factory ResultEntity.fromRow({
    required int testId,
    required int id,
    required List<int> answers,
    required int correctAnswerAmount,
    required int durationInSeconds,
    required DateTime completedAt,
  }) => ResultEntity(
    testId: testId,
    id: id,
    answers: answers,
    correctAnswerAmount: correctAnswerAmount,
    durationInSeconds: durationInSeconds,
    completedAt: completedAt,
  );
}
