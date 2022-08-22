void main() {
  print('hello world');
  Person p = Person();
  p.directParamsMethod(1, 1);
  p.positionalParamsMethod(3, 32);
  p.positionalParamsMethod(3);
  p.namedParamsMethod(1, c: 2);
  p.namedParamsMethod(1, c: 2, b: 1);

  p.test();
}

class Person {
  int number = 1; // detect data type and assign a value
  int? num; // detect data type and could be null
  var str = 'hello world'; // runtime data type and assign value
  var name; //runtime data type and could be null
  dynamic point =
      '{"x": 1,"y": 2}'; // dynamic data type could be changed every assign time and assign first value
  dynamic
      vector; //dynamic data type could be changed every assign time and could be null
  void test() {
    point = Point();
    point = 2;
    name = 2;
    name = 'name';
    // number = 'str'; // will throw an exception
  }

  void directParamsMethod(int? a, int? b) {
    if (a != null && b != null) {
      print('a + b = ${a + b}');
    }
  }

  void positionalParamsMethod(int a, [int? b]) {
    if (b != null) print('a + b = ${a + b}');
  }

  void namedParamsMethod(int a, {int b = 0, required int c}) {
    print('a + b = ${a + b}');
  }
}

class Point {}
