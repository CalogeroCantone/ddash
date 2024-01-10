dynamic _baseGetDict(Map obj, dynamic key, [dynamic defaultValue]) {
  dynamic value = obj.containsKey(key) ? obj[key] : defaultValue;

  if (value == null && key is! int) {
    try {
      value = obj[int.parse(key.toString())] ?? defaultValue;
    } catch (e) {
      // pass
    }
  }

  return value;
}

dynamic _baseGetItem(List obj, dynamic key, [dynamic defaultValue]) {
  dynamic value;

  try {
    value = obj[int.parse(key.toString())];
  } catch (e) {
    // pass
  }

  if (value == null && key is! int) {
    try {
      value = obj[int.parse(key.toString())];
    } catch (e) {
      // pass
    }
  }

  return value ?? defaultValue;
}

dynamic _baseGetObject(dynamic obj, dynamic key, [dynamic defaultValue]) {
  dynamic value = _baseGetItem(obj, key, defaultValue);

  if (value == null) {
    try {
      value = obj[key];
    } catch (e) {
      // pass
    }
  }

  return value ?? defaultValue;
}

dynamic baseGet(dynamic obj, dynamic key, [dynamic defaultValue]) {
  dynamic value;

  if (obj is Map) {
    value = _baseGetDict(obj, key, defaultValue);
  } else if (obj is! Map && obj is! List) {
    value = _baseGetObject(obj, key, defaultValue);
  } else {
    value = _baseGetItem(obj, key, defaultValue);
  }

  if (value == null) {
    throw Exception('Object "${obj.toString()}" does not have key "$key"');
  }

  return value;
}

class PathToken {
  dynamic value;
  Function defaultFactory;

  PathToken(this.value, this.defaultFactory);
}

List<PathToken> toPathTokens(dynamic value) {
  List<PathToken> keys = [];
  RegExp rePathListIndex = RegExp(r'\[\d+\]');
  RegExp rePathKeyDelim = RegExp(r'\.|\[');

  if (value is String && (value.contains('.') || value.contains('['))) {
    var splitValues =
        rePathKeyDelim.allMatches(value).map((m) => m.group(0)).toList();
    keys = splitValues.map((key) {
      if (rePathListIndex.hasMatch(key!)) {
        return PathToken(
            int.parse(key.substring(1, key.length - 1)), () => <dynamic>[]);
      } else {
        return PathToken(unescapePathKey(key), () => <String, dynamic>{});
      }
    }).toList();
  } else if (value is String || value is num) {
    keys = [PathToken(value, () => <String, dynamic>{})];
  } else if (value == null) {
    keys = [];
  } else {
    keys = value;
  }

  return keys;
}

String unescapePathKey(String key) {
  key = key.replaceAll(r'\\', '\\');
  key = key.replaceAll(r'\.', '.');
  return key;
}

List<dynamic> toPath(dynamic value) {
  List<dynamic> path = [];
  List<PathToken> tokens = toPathTokens(value);

  // ignore: unnecessary_type_check
  if (tokens is List) {
    path = tokens.map((token) {
      // ignore: unnecessary_type_check
      if (token is PathToken) {
        return token.value;
      } else {
        return token;
      }
    }).toList();
  } else {
    path = [tokens];
  }

  return path;
}

dynamic get(dynamic obj, dynamic path, [dynamic defaultValue]) {
  dynamic sentinel = defaultValue == null ? null : Object();

  for (var key in toPath(path)) {
    obj = baseGet(obj, key, sentinel);

    if (obj == sentinel) {
      obj = defaultValue;
      break;
    }
  }

  return obj;
}
