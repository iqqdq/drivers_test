extension DoubleExtensions on double {
  String toStringPercent() {
    if (this == 0.0) return '${toInt()}%';

    final percent = toStringAsFixed(2);

    if (percent.endsWith('00')) {
      return '${percent.split('.').first}%';
    } else if (percent.endsWith('0')) {
      return '${percent.substring(0, percent.length - 1)}%';
    } else {
      return '$percent%';
    }
  }
}
