extension StateExtension on String {
  String toState() {
    return split('_')
        .map((word) {
          final lowerWord = word.toLowerCase();
          if (lowerWord == 'of' || lowerWord == 'the' || lowerWord == 'and') {
            return lowerWord;
          }
          return word.isNotEmpty
              ? word[0].toUpperCase() + word.substring(1).toLowerCase()
              : '';
        })
        .join(' ')
        .replaceFirstMapped(
          RegExp(r'^[a-z]'),
          (match) => match.group(0)!.toUpperCase(),
        );
  }
}
