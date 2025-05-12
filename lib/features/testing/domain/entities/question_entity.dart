class QuestionEntity {
  String? image;
  final String text;
  final List<String> answers;
  final int correct;
  int? answer;

  QuestionEntity({
    this.image,
    required this.text,
    required this.answers,
    required this.correct,
    this.answer,
  });

  Map<String, dynamic> toJson() => {
    'image': image,
    'text': text,
    'answers': answers,
    'correct': correct,
    'answer': answer,
  };

  factory QuestionEntity.fromJson(Map<String, dynamic> json) => QuestionEntity(
    image: json['image'] as String,
    text: json['text'] as String,
    answers: List<String>.from(json['answers'] as List),
    correct: json['correct'] as int,
    answer: json['answer'] as int,
  );

  QuestionEntity copyWith({
    String? image,
    String? text,
    List<String>? answers,
    int? correct,
    int? answer,
  }) => QuestionEntity(
    image: image ?? this.image,
    text: text ?? this.text,
    answers: answers ?? this.answers,
    correct: correct ?? this.correct,
    answer: answer ?? this.answer,
  );
}
