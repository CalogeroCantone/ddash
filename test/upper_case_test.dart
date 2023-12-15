import 'package:ddash/src/upper_case/extension.dart';
import 'package:test/test.dart';

void main() {
  group('upperCase', () {
    test('should convert a string to uppercase', () {
      final str = 'hello, world!';
      final result = str.upperCase();
      expect(result, 'HELLO, WORLD!');
    });

    test('should return an empty string if the input is empty', () {
      final str = '';
      final result = str.upperCase();
      expect(result, '');
    });

    test('should return the same string if it is already in uppercase', () {
      final str = 'HELLO, WORLD!';
      final result = str.upperCase();
      expect(result, 'HELLO, WORLD!');
    });
  });
}
