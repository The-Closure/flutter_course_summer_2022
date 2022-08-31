void main() {
  String str = 'hello wrld Edit the Expression';
  int unicodeE = str.codeUnitAt(1);
  print(unicodeE);
  bool hasWhiteSpace = str.contains(' ');
  print(hasWhiteSpace);
  bool isWellFormat = str.endsWith('.com');
  print(isWellFormat);
  int lLetterIndex = str.indexOf('l');
  print(lLetterIndex);
  int lastlLetterIndex = str.lastIndexOf('l');
  print(lastlLetterIndex);
  String hashedStr = str.padLeft(2, '#');
  print(hashedStr);
  String lastHashedStr = str.padRight(2, '#');
  print(lastHashedStr);
  String hetto = str.replaceAll('l', 't');
  print(hetto);

  String noLatinstr =
      str.replaceAllMapped(RegExp(r'\b(\w*?)([aeiou]\w*)'), (match) {
    String temp = str.substring(match.start, match.end);
    return String.fromCharCodes(temp.runes.map((e) {
      return e + 1;
    }));
  });
  print(noLatinstr);

  String replacedStr = str.replaceRange(8, null, '#');
  print(replacedStr);
  List<String> wordsList = str.split(' ');
  wordsList.forEach((element) {
    print(element);
  });
  String result = 'Eats shoots leaves shoots again'
      .splitMapJoin(RegExp(r'shoots'), onMatch: (m) {
    return '${m[0]}';
  }, // (or no onMatch at all)
          onNonMatch: (n) {
    return '*';
  });
  print(result); // *shoots*
}
