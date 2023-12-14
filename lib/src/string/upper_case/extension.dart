import 'package:ddash/src/string/words/extension.dart';

extension UpperCaseStringExtension on String {
  /// Creates a new string with all words converted to upper case.
  ///
  /// Example:
  /// ```dart
  /// '--foo-bar'.upperCase(); // 'FOO BAR'
  /// 'fooBar'.upperCase(); // 'FOO BAR'
  /// '__foo_bar__'.upperCase(); // 'FOO BAR'
  /// ```
  String upperCase() {
    List<String?> words = this.words();
    return words.map((e) => e!.toUpperCase()).toList().join(" ");
  }
}
