import 'package:ddash/src/get/helpers.dart';
import 'package:test/test.dart';

void main() {
  group('get', () {
    test('should return the value at the specified path', () {
      final map = {
        'a': {
          'b': {
            'c': 123,
          },
        },
      };

      expect(get(map, 'a.b.c'), 123);
    });

    test('should return the default value if path does not exist', () {
      final map = {
        'a': {
          'b': {
            'c': 123,
          },
        },
      };

      expect(get(map, 'a.b.d', 'default'), 'default');
    });

    test('should return the default value if path is null', () {
      final map = {
        'a': {
          'b': {
            'c': 123,
          },
        },
      };

      expect(get(map, null, 'default'), 'default');
    });
  });
}
