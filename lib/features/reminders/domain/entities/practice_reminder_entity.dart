class PracticeReminderEntity {
  List<int> daysOfWeek;
  int hour;
  int minute;

  PracticeReminderEntity({
    required this.daysOfWeek,
    required this.hour,
    required this.minute,
  });

  factory PracticeReminderEntity.fromRow({
    required List<int> daysOfWeek,
    required int hour,
    required int minute,
  }) => PracticeReminderEntity(
    daysOfWeek: daysOfWeek,
    hour: hour,
    minute: minute,
  );
}
