import 'package:ddash/ddash.dart';
import 'package:test/test.dart';

void main() {
  group('String', () {
    test('lastIndexOf', () {
      expect('0.0001'.lastIndexOf('f'), -1);
      expect('0.0001'.lastIndexOf('0'), 4);
      expect('0.0001'.lastIndexOf('0', 5), 4);
      expect('0.0001'.lastIndexOf(RegExp(r'0'), 5), 4);
      expect('aabbcc'.lastIndexOf(RegExp(r'b')), 3);
    });
    test('replaceLast', () {
      expect('0.0001'.replaceLast('f', ''), '0.0001');
      expect('0.0001'.replaceLast('0', ''), '0.001');
      expect('0.0001'.replaceLast(RegExp(r'0'), '7', 5), '0.0071');
      expect('0.0001'.replaceLast(RegExp(r'0'), '7', 3), '0.0701');
      expect('aabbcc'.replaceLast(RegExp(r'b'), 'd'), 'aabdcc');
    });

    test('words', () {
      expect('Hello world'.words(), ['Hello', 'world']);
      expect('--foo-bar'.words(), ['foo', 'bar']);
      expect('fooBar'.words(), ['foo', 'Bar']);
      expect('__foo_bar__'.words(), ['foo', 'bar']);
    });

    test('upperCase', () {
      expect('--foo-bar'.upperCase(), 'FOO BAR');
      expect('fooBar'.upperCase(), 'FOO BAR');
      expect('__foo_bar__'.upperCase(), 'FOO BAR');
    });
  });
}
