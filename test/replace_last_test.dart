import 'package:ddash/src/replace_last/extension.dart';
import 'package:test/test.dart';

void main() {
  group('replaceLast', () {
    test('should replace the last occurrence of a pattern in a string', () {
      final str = 'Hello, World!';
      final result = str.replaceLast('o', 'x');
      expect(result, 'Hello, Wxrld!');
    });

    test(
        'should replace the last occurrence of a pattern in a string with a specified start index',
        () {
      final str = 'Hello, World!';
      final result = str.replaceLast('o', 'x', 7);
      expect(result, 'Hellx, World!');
    });

    test('should return the original string if the pattern is not found', () {
      final str = 'Hello, World!';
      final result = str.replaceLast('z', 'x');
      expect(result, 'Hello, World!');
    });

    test('should return the original string if the start index is out of range',
        () {
      final str = 'Hello, World!';
      final result = str.replaceLast('o', 'x', 20);
      expect(result, 'Hello, World!');
    });
  });

  group('extra', () {
    test('old', () {
      expect('0.0001'.replaceLast('f', ''), '0.0001');
      expect('0.0001'.replaceLast('0', ''), '0.001');
      expect('0.0001'.replaceLast(RegExp(r'0'), '7', 5), '0.0071');
      expect('0.0001'.replaceLast(RegExp(r'0'), '7', 3), '0.0701');
      expect('aabbcc'.replaceLast(RegExp(r'b'), 'd'), 'aabdcc');
    });

    test('lastIndexOf', () {
      expect('0.0001'.lastIndexOf('f'), -1);
      expect('0.0001'.lastIndexOf('0'), 4);
      expect('0.0001'.lastIndexOf('0', 5), 4);
      expect('0.0001'.lastIndexOf(RegExp(r'0'), 5), 4);
      expect('aabbcc'.lastIndexOf(RegExp(r'b')), 3);
    });
  });
}
