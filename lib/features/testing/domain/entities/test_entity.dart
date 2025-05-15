import 'question_entity.dart';

class TestEntity {
  final String category;
  final String name;
  List<QuestionEntity> questions;

  TestEntity({
    required this.category,
    required this.name,
    required this.questions,
  });

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
