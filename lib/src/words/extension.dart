import 'package:ddash/src/words/helpers.dart';

extension WordsStringExtension on String {
  /// Splits the string into a list of words.
  ///
  /// Example:
  /// ```dart
  /// 'Hello world'.words(); // ['Hello', 'world']
  /// '--foo-bar'.words(); // ['foo', 'bar']
  /// 'fooBar'.words(); // ['foo', 'Bar']
  /// '__foo_bar__'.words(); // ['foo', 'bar']
  /// ```
  List<String> words([Pattern? pattern]) {
    if (pattern == null) {
      final result =
          hasUnicodeWord.hasMatch(this) ? unicodeWords(this) : asciiWords(this);

      return result;
    }

    return pattern.allMatches(this).map((match) => match.group(0)!).toList();
  }
}
