import 'dart:core';

extension ReplaceLastStringExtension on String {
  /// Creates a new string with the last occurrence of [from] replaced by [to].
  ///
  /// Finds a match of pattern by searching backward starting at [start], defaulting to the end of the string.:
  ///
  /// Example:
  /// ```dart
  /// '0.0001'.replaceLast('f', ''); // '0.0001'
  /// '0.0001'.replaceLast('0', ''); // '0.001'
  /// '0.0001'.replaceLast(RegExp(r'0'), '7', 5); // '0.0071'
  /// '0.0001'.replaceLast(RegExp(r'0'), '7', 3); // '0.0701'
  /// 'aabbcc'.replaceLast(RegExp(r'b'), 'd'); // 'aabdcc'
  /// ```
  String replaceLast(Pattern from, String to, [int? start]) {
    if (isEmpty) {
      return this;
    }

    final index = lastIndexOf(from, start);
    if (index == -1) {
      return this;
    }

    String? replacement;
    if (from is String) {
      replacement = replaceRange(index, index + from.length, to);
    } else if (from is RegExp) {
      Match match = from.matchAsPrefix(this, index)!;

      replacement = replaceRange(match.start, match.end, to);
    }

    return replacement ?? this;
  }
}
