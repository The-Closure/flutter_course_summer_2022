import 'package:flutter_course_summer_2022/consts.dart';

void main() async {
  DataCollector dc = DataCollector();
  Future<int> result = dc.findDiff(langsList).then((value) => value);
  print('COLLECT LANGS DIFF');
  result.then(
    (value) {
      print(value);
    },
  );
  print('TEST FIRST CALL ${await result}');
  int directResult = await dc.findDiff(langsList);

  print('FINAL COLLECT');
}

class DataCollector {
  Future<int> findDiff(List<String> items) async {
    int val = 0;
    for (var i = 0; i < items.length; i++) {
      if (i == 0) {
        dynamic wait = await Future.delayed(Duration(milliseconds: 3000));
        int runeVal = 0;
        items[i].runes.toList().forEach((char) {
          runeVal = runeVal + char;
        });
        val = runeVal;
      } else {
        int runeVal = 0;
        items[i].runes.toList().forEach((char) {
          runeVal = runeVal + char;
        });
        val = val - runeVal;
      }
    }
    print('I can continue finding the diff');
    return val;
  }
}
