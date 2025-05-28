extension NumExtensions on num {
  String toTimeUnit() => toString().length == 1 ? '0$this' : '$this';
}
