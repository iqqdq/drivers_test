class JsonData {
  final int id;
  final String state;
  final int min;
  final int max;
  final List<JsonQuestion> questions;

  JsonData({
    required this.id,
    required this.state,
    required this.min,
    required this.max,
    required this.questions,
  });

  factory JsonData.fromJson(Map<String, dynamic> json) => JsonData(
    id: json['id'],
    state: json['state'],
    min: json['min'],
    max: json['max'],
    questions:
        (json['questions'] as List)
            .map((e) => JsonQuestion.fromJson(e))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'state': state,
    'min': min,
    'max': max,
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
