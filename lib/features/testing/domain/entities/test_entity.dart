import 'question_entity.dart';

class TestEntity {
  final String category;
  final String name;
  final List<QuestionEntity> questions;

  TestEntity({
    required this.category,
    required this.name,
    required this.questions,
  });

  Map<String, dynamic> toJson() => {
    'category': category,
    'name': name,
    'questions': questions.map((element) => element.toJson()).toList(),
  };

  factory TestEntity.fromJson(Map<String, dynamic> json) => TestEntity(
    category: json['category'] as String,
    name: json['name'] as String,
    questions:
        (json['questions'] as List)
            .map((json) => QuestionEntity.fromJson(json))
            .toList(),
  );

  TestEntity copyWith({
    String? category,
    String? name,
    List<QuestionEntity>? questions,
    int? accuracy,
  }) => TestEntity(
    category: category ?? this.category,
    name: name ?? this.name,
    questions: questions ?? this.questions,
  );
}
