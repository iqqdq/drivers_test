class ExamReminderEnity {
  DateTime? dateTime;
  int hour;
  int minute;
  int daysUntilRemind;
  bool? isEnabled;

  ExamReminderEnity({
    this.dateTime,
    int? hour,
    int? minute,
    int? daysUntilRemind,
    this.isEnabled,
  }) : hour = hour ?? DateTime.now().hour,
       minute = minute ?? DateTime.now().minute,
       daysUntilRemind = daysUntilRemind ?? 0;

  factory ExamReminderEnity.fromRow({
    required DateTime? date,
    required int hour,
    required int minute,
    required int? daysUntilRemind,
    required bool? isEnabled,
  }) => ExamReminderEnity(
    dateTime: date,
    hour: hour,
    minute: minute,
    daysUntilRemind: daysUntilRemind,
    isEnabled: isEnabled,
  );
}
