import 'package:ddash/src/string/upper_case/extension.dart';
import 'package:test/test.dart';

void main() {
  group('upperCase', () {
    test('should return an empty string if the input is empty', () {
      const str = '';
      final result = str.upperCase();
      expect(result, '');
    });

    test('should return the same string if it is already in uppercase', () {
      const str = 'FOO BAR';
      final result = str.upperCase();
      expect(result, 'FOO BAR');
    });

    test('should convert a kebabCase string to uppercase', () {
      const str = '--foo-bar';
      final result = str.upperCase();
      expect(result, 'FOO BAR');
    });

    test('should convert a camelCase string to uppercase', () {
      const str = 'fooBar';
      final result = str.upperCase();
      expect(result, 'FOO BAR');
    });

    test('should convert a underscoreCase string to uppercase', () {
      const str = '__foo_bar__';
      final result = str.upperCase();
      expect(result, 'FOO BAR');
    });
  });
}
