import 'package:ddash/src/words/extension.dart';
import 'package:test/test.dart';

void main() {
  group('words', () {
    test('should return an empty list if the string is empty', () {
      const str = '';
      final result = str.words();
      expect(result, []);
    });

    test('should return an empty list if no words are found', () {
      const str = '__----__';
      final result = str.words();
      expect(result, []);
    });
    test('should return a list of words in a string', () {
      const str = 'Hello world';
      final result = str.words();
      expect(result, ['Hello', 'world']);
    });

    test('should return a list of words in a kebabCase string', () {
      const str = '--foo-bar';
      final result = str.words();
      expect(result, ['foo', 'bar']);
    });

    test('should return a list of words in a camelCase string', () {
      const str = 'fooBar';
      final result = str.words();
      expect(result, ['foo', 'Bar']);
    });

    test('should return a list of words in a underscoredCase string', () {
      const str = '__foo_bar__';
      final result = str.words();
      expect(result, ['foo', 'bar']);
    });
  });
}
