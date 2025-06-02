class PracticeReminderEntity {
  List<int> daysOfWeek;
  int hour;
  int minute;
  bool? isEnabled;

  PracticeReminderEntity({
    List<int>? daysOfWeek,
    int? hour,
    int? minute,
    this.isEnabled,
  }) : daysOfWeek = daysOfWeek ?? [],
       hour = hour ?? DateTime.now().hour,
       minute = minute ?? DateTime.now().minute;

  factory PracticeReminderEntity.fromRow({
    required List<int>? daysOfWeek,
    required int hour,
    required int minute,
    required bool? isEnabled,
  }) => PracticeReminderEntity(
    daysOfWeek: daysOfWeek,
    hour: hour,
    minute: minute,
    isEnabled: isEnabled,
  );
}
