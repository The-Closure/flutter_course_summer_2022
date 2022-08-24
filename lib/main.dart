void main() {
  List<String> alpha = ['dart', 'test'];
  alpha.add('abc');
  alpha.add('two');
  alpha.addAll(['three', 'three', 'bcde', 'four', 'cdef']);

  alpha.sort(
    (a, b) {
      String a2 = a.split('')[1];
      String b2 = b.split('')[1];
      return a2.compareTo(b2);
    },
  );

  bool anyResult = alpha.any((item) {
    return item.contains('z');
  });

  alpha.remove('three');

  alpha.removeAt(0);

  alpha.removeWhere((element) {
    return element.contains('a');
  });

  List<int> intAlpha = alpha.map((e) {
    int sum = 0;
    e.split('').forEach((element) {
      sum = sum + element.codeUnitAt(0);
    });
    return sum;
  }).toList();

  Map<String, dynamic> beta = {'key2': 1, 'key3': 'value3'};
  beta['key1'] = 'value1';

  beta.forEach((key, value) {
    print(key);
    print(value.toString());
  });

  Map<String, dynamic> markedBeta = beta.map((key, value) {
    if (value is String) {
      key = '${key}_proceed';
    }
    return MapEntry(key, value);
  });

  Set<String> uniqueValues = {};
  uniqueValues.add('value1');
  uniqueValues.add('value2');
  uniqueValues.add('value1');

  print('exit 0 code ');
}
