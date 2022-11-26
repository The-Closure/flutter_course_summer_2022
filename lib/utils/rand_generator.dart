import 'dart:math';

class RandGenerator {
  Future<int> generateBasedOnPrevNumber({int prevNumber = 0}) async {
    await Future.delayed(Duration(seconds: 2));
    return Random().nextInt(prevNumber + 10);
  }
}
