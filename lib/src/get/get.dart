/// Gets the value at `path` of `object`. If the resolved value is
/// `undefined`, the `defaultValue` is returned in its place.
///

/// Eexample
/// const object = { 'a': [{ 'b': { 'c': 3 } }] }
///
/// get(object, 'a[0].b.c')
/// // => 3
///
/// get(object, ['a', '0', 'b', 'c'])
/// // => 3
///
/// get(object, 'a.b.c', 'default')
/// // => 'default'
dynamic get(Map<String, dynamic> object, dynamic path, [dynamic defaultValue]) {
  if (path == null) {
    return defaultValue;
  }

  final List<String> pathList = path is String ? path.split('.') : path;

  dynamic result = object;
  for (final String key in pathList) {
    if (result is Map<String, dynamic>) {
      result = result[key];
    } else if (result is List<dynamic>) {
      final int? index = int.tryParse(key);
      if (index != null) {
        result = result[index];
      } else {
        return defaultValue;
      }
    } else {
      return defaultValue;
    }
  }
}
