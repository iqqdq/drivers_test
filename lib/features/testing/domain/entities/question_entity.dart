class QuestionEntity {
  String? image;
  final String question;
  final List<String> answers;
  final int correct;
  int? answer;

  QuestionEntity({
    this.image,
    required this.question,
    required this.answers,
    required this.correct,
    this.answer,
  });

  factory QuestionEntity.fromRow({
    required String? image,
    required String question,
    required List<String> answers,
    required int correct,
    required int? answer,
  }) => QuestionEntity(question: question, answers: answers, correct: correct);

  QuestionEntity copyWith({
    String? image,
    String? question,
    List<String>? answers,
    int? correct,
    int? answer,
  }) => QuestionEntity(
    image: image ?? this.image,
    question: question ?? this.question,
    answers: answers ?? this.answers,
    correct: correct ?? this.correct,
    answer: answer ?? this.answer,
  );
}
