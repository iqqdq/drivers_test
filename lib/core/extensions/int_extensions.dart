extension IntExtensions on int {
  String toTimeUnit() => toString().length == 1 ? '0$this' : '$this';
}
