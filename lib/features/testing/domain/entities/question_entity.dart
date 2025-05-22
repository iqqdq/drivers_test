class QuestionEntity {
  final int testId;
  final int id;
  final String? image;
  final String question;
  final List<String> choices;
  final int correct;
  int? answer;

  QuestionEntity({
    required this.testId,
    required this.id,
    this.image,
    required this.question,
    required this.choices,
    required this.correct,
    this.answer,
  });

  factory QuestionEntity.fromRow({
    required int testId,
    required int id,
    required String? image,
    required String question,
    required List<String> choices,
    required int correct,
  }) => QuestionEntity(
    testId: testId,
    id: id,
    image: image,
    question: question,
    choices: choices,
    correct: correct,
  );

  QuestionEntity copyWith({int? answer}) => QuestionEntity(
    testId: testId,
    id: id,
    image: image,
    question: question,
    choices: choices,
    correct: correct,
    answer: answer ?? this.answer,
  );
}
