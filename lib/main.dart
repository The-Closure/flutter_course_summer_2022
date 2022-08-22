void main() {
  List<dynamic> alpha = [0, 'test'];
  alpha.add('a');
  alpha.add(2);
  alpha.addAll([3, 'b', 4, 'c']);

  Map<String, dynamic> beta = {'key2': 1, 'key3': 'value3'};
  beta['key1'] = 'value1';

  Set<String> uniqueValues = {};
  uniqueValues.add('value1');
  uniqueValues.add('value2');
  uniqueValues.add('value1');

  print('exit 0 code ');
}
