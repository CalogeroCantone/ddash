import 'package:ddash/src/upper_case/extension.dart';
import 'package:test/test.dart';

void main() {
  group('upperCase', () {
    test('should convert a string to uppercase', () {
      const str = '--foo-bar';
      final result = str.upperCase();
      expect(result, 'FOO BAR');
    });

    test('should return an empty string if the input is empty', () {
      const str = 'fooBar';
      final result = str.upperCase();
      expect(result, 'FOO BAR');
    });

    test('should return the same string if it is already in uppercase', () {
      const str = '__foo_bar__';
      final result = str.upperCase();
      expect(result, 'FOO BAR');
    });
  });
}
