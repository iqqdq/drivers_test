extension DateTimeExtensions on DateTime {
  String toDateString() {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    final month = months[this.month - 1];
    final day = this.day;
    final year = this.year;

    return '$month $day, $year';
  }
}
