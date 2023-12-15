import 'package:ddash/src/replace_last/extension.dart';
import 'package:test/test.dart';

void main() {
  group('replaceLast', () {
    test('should replace the last occurrence of a pattern in a string', () {
      final str = 'Hello, World!';
      final result = str.replaceLast('o', 'X');
      expect(result, 'Hello, Wxrld!');
    });

    test(
        'should replace the last occurrence of a pattern in a string with a specified start index',
        () {
      final str = 'Hello, World!';
      final result = str.replaceLast('o', 'X', 7);
      expect(result, 'Hello, Wxrld!');
    });

    test('should return the original string if the pattern is not found', () {
      final str = 'Hello, World!';
      final result = str.replaceLast('z', 'X');
      expect(result, 'Hello, World!');
    });

    test('should return the original string if the start index is out of range',
        () {
      final str = 'Hello, World!';
      final result = str.replaceLast('o', 'X', 20);
      expect(result, 'Hello, World!');
    });
  });
}
