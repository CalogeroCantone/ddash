import 'package:ddash/src/words/extension.dart';
import 'package:test/test.dart';

void main() {
  group('words', () {
    test('should return a list of words in a string', () {
      final str = 'Hello world';
      final result = str.words();
      expect(result, ['Hello', 'world']);
    });

    test('should return a list of words in a string with a specified pattern',
        () {
      final str = '--foo-bar';
      final result = str.words();
      expect(result, ['foo', 'bar']);
    });

    test('should return an empty list if the string is empty', () {
      final str = 'fooBar';
      final result = str.words();
      expect(result, ['foo', 'Bar']);
    });

    test('should return an empty list if no words are found', () {
      final str = '__foo_bar__';
      final result = str.words();
      expect(result, ['foo', 'bar']);
    });
  });
}
