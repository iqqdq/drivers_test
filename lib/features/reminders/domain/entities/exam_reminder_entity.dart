class ExamReminderEnity {
  final DateTime dateTime;
  final int? daysUntilRemind;

  ExamReminderEnity({required this.dateTime, this.daysUntilRemind});

  factory ExamReminderEnity.fromRow({
    required DateTime date,
    required int? daysUntilRemind,
  }) => ExamReminderEnity(dateTime: date, daysUntilRemind: daysUntilRemind);
}
