class JsonData {
  final int id;
  final String state;
  final int total;
  final int min;
  final List<JsonQuestion> questions;

  JsonData({
    required this.id,
    required this.state,
    required this.total,
    required this.min,
    required this.questions,
  });

  factory JsonData.fromJson(Map<String, dynamic> json) => JsonData(
    id: json['id'],
    state: json['state'],
    total: json['total'],
    min: json['min'],
    questions:
        (json['questions'] as List)
            .map((e) => JsonQuestion.fromJson(e))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'state': state,
    'total': total,
    'min': min,
    'questions': questions.map((e) => e.toJson()).toList(),
  };
}

class JsonQuestion {
  final int id;
  final String? image;
  final String question;
  final List<String> choices;
  final int correct;

  JsonQuestion({
    required this.id,
    this.image,
    required this.question,
    required this.choices,
    required this.correct,
  });

  factory JsonQuestion.fromJson(Map<String, dynamic> json) => JsonQuestion(
    id: json['id'],
    image: json.containsKey('image') ? json['image'] : null,
    question: json['question'],
    choices: List<String>.from(json['choices']),
    correct: json['correct'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'image': image,
    'question': question,
    'choices': choices,
    'correct': correct,
  };
}
