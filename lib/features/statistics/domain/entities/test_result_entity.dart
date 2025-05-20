class TestResultEntity {
  final String testCategory;
  final String testName;
  final List<int> answers;
  final DateTime finishedAt;

  TestResultEntity({
    required this.testCategory,
    required this.testName,
    required this.answers,
    required this.finishedAt,
  });

  factory TestResultEntity.fromRow({
    required String testCategory,
    required String testName,
    required List<String> answers,
    required String finishedAt,
  }) => TestResultEntity(
    testCategory: testCategory,
    testName: testName,
    answers: answers.map((str) => int.parse(str)).toList(),
    finishedAt: DateTime.parse(finishedAt),
  );
}
