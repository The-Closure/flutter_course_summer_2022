void main() {
  List<String> alpha = ['dart', 'test'];
  alpha.add('a');
  alpha.add('two');
  alpha.addAll(['three', 'b', 'four', 'c']);

  alpha.sort();

  Map<String, dynamic> beta = {'key2': 1, 'key3': 'value3'};
  beta['key1'] = 'value1';

  Set<String> uniqueValues = {};
  uniqueValues.add('value1');
  uniqueValues.add('value2');
  uniqueValues.add('value1');

  print('exit 0 code ');
}
