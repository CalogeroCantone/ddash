import 'dart:core';

final hasUnicodeWord = RegExp(
    r'[a-z][A-Z]|[A-Z]{2}[a-z]|[0-9][a-zA-Z]|[a-zA-Z][0-9]|[^a-zA-Z0-9 ]');
final reAsciiWord = RegExp(r'[^\x00-\x2f\x3a-\x40\x5b-\x60\x7b-\x7f]+');

List<String> asciiWords(String string) {
  return reAsciiWord
      .allMatches(string)
      .map((match) => match.group(0)!)
      .toList();
}

final rsAstralRange = '\\ud800-\\udfff';
final rsComboMarksRange = '\\u0300-\\u036f';
final reComboHalfMarksRange = '\\ufe20-\\ufe2f';
final rsComboSymbolsRange = '\\u20d0-\\u20ff';
final rsComboMarksExtendedRange = '\\u1ab0-\\u1aff';
final rsComboMarksSupplementRange = '\\u1dc0-\\u1dff';
final rsComboRange = rsComboMarksRange +
    reComboHalfMarksRange +
    rsComboSymbolsRange +
    rsComboMarksExtendedRange +
    rsComboMarksSupplementRange;
final rsDingbatRange = '\\u2700-\\u27bf';
final rsLowerRange = 'a-z\\xdf-\\xf6\\xf8-\\xff';
final rsMathOpRange = '\\xac\\xb1\\xd7\\xf7';
final rsNonCharRange = '\\x00-\\x2f\\x3a-\\x40\\x5b-\\x60\\x7b-\\xbf';
final rsPunctuationRange = '\\u2000-\\u206f';
final rsSpaceRange =
    ' \\t\\x0b\\f\\xa0\\ufeff\\n\\r\\u2028\\u2029\\u1680\\u180e\\u2000\\u2001\\u2002\\u2003\\u2004\\u2005\\u2006\\u2007\\u2008\\u2009\\u200a\\u202f\\u205f\\u3000';
final rsUpperRange = 'A-Z\\xc0-\\xd6\\xd8-\\xde';
final rsVarRange = '\\ufe0e\\ufe0f';
final rsBreakRange =
    rsMathOpRange + rsNonCharRange + rsPunctuationRange + rsSpaceRange;

final rsApos = "['\u2019]";
final rsBreak = '[$rsBreakRange]';
final rsCombo = '[$rsComboRange]';
final rsDigit = '\\d';
final rsDingbat = '[$rsDingbatRange]';
final rsLower = '[$rsLowerRange]';
final rsMisc =
    '[^$rsAstralRange$rsBreakRange$rsDigit$rsDingbatRange$rsLowerRange$rsUpperRange]';
final rsFitz = '\\ud83c[\\udffb-\\udfff]';
final rsModifier = '(?:$rsCombo|$rsFitz)';
final rsNonAstral = '[^$rsAstralRange]';
final rsRegional = '(?:\\ud83c[\\udde6-\\uddff]){2}';
final rsSurrPair = '[\\ud800-\\udbff][\\udc00-\\udfff]';
final rsUpper = '[$rsUpperRange]';
final rsZWJ = '\\u200d';

final rsMiscLower = '(?:$rsLower|$rsMisc)';
final rsMiscUpper = '(?:$rsUpper|$rsMisc)';
final rsOptContrLower = '(?:$rsApos(?:d|ll|m|re|s|t|ve))?';
final rsOptContrUpper = '(?:$rsApos(?:D|LL|M|RE|S|T|VE))?';
final reOptMod = '$rsModifier?';
final rsOptVar = '[$rsVarRange]?';
final rsOptJoin = '(?:$rsZWJ(?:${[
  rsNonAstral,
  rsRegional,
  rsSurrPair
].join('|')})$rsOptVar$reOptMod)*';
final rsOrdLower = '\\d*(?:1st|2nd|3rd|(?![123])\\dth)(?=\\b|[A-Z_])';
final rsOrdUpper = '\\d*(?:1ST|2ND|3RD|(?![123])\\dTH)(?=\\b|[a-z_])';
final rsSeq = rsOptVar + reOptMod + rsOptJoin;
final rsEmoji = '(?:${[rsDingbat, rsRegional, rsSurrPair].join('|')})$rsSeq';

final reUnicodeWords = RegExp(
    [
      '$rsUpper?$rsLower+$rsOptContrLower(?=${[
        rsBreak,
        rsUpper,
        '\$'
      ].join('|')})',
      '$rsMiscUpper+$rsOptContrUpper(?=${[
        rsBreak,
        rsUpper + rsMiscLower,
        '\$'
      ].join('|')})',
      '$rsUpper?$rsMiscLower+$rsOptContrLower',
      '$rsUpper+$rsOptContrUpper',
      rsOrdUpper,
      rsOrdLower,
      '$rsDigit+',
      rsEmoji
    ].join('|'),
    multiLine: true);

List<String> unicodeWords(String string) {
  return reUnicodeWords
      .allMatches(string)
      .map((match) => match.group(0)!)
      .toList();
}
