class TestEntity {
  final int id;
  final String state;
  final String name;
  final int amount;
  int? result;

  TestEntity({
    required this.id,
    required this.state,
    required this.name,
    required this.amount,
    this.result,
  });

  factory TestEntity.fromRow({
    required int id,
    required String state,
    required String name,
    required int amount,
  }) => TestEntity(id: id, state: state, name: name, amount: amount);

  bool get isExam => name.toLowerCase() == 'exam';
  int get correct => result ?? 0;
  int? get accuracy => correct == 0 ? null : ((correct / amount) * 100).toInt();
  bool get isPassed => accuracy == null ? false : accuracy! >= 90;
}
