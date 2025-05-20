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
    required int? result,
  }) => TestEntity(
    id: id,
    state: state,
    name: name,
    amount: amount,
    result: result,
  );

  TestEntity copyWith({int? result}) => TestEntity(
    id: id,
    state: state,
    name: name,
    amount: amount,
    result: result ?? this.result,
  );
}
