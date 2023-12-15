import 'package:ddash/src/words/extension.dart';
import 'package:test/test.dart';

void main() {
  group('words', () {
    test('should return a list of words in a string', () {
      final str = 'Hello, World!';
      final result = str.words();
      expect(result, ['Hello', 'World']);
    });

    test('should return a list of words in a string with a specified pattern',
        () {
      final str = 'Hello, World!';
      final result = str.words(RegExp(r'\W+'));
      expect(result, ['Hello', 'World']);
    });

    test('should return an empty list if the string is empty', () {
      final str = '';
      final result = str.words();
      expect(result, []);
    });

    test('should return an empty list if no words are found', () {
      final str = '12345';
      final result = str.words();
      expect(result, []);
    });
  });
}
