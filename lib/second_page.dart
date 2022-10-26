import 'package:flutter/material.dart';
import 'dart:math' as math;

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);
  double skewY = 0.0;
  Stream<void> rotatePercentage() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 10));
      yield (skewY += 0.01);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: Colors.black,
          child: StreamBuilder<void>(
              stream: rotatePercentage(),
              builder: (context, snapshot) {
                return Hero(
                  transitionOnUserGestures: true,
                  tag: 'rotatual element',
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.skewX(0)
                      ..rotateZ(skewY * math.pi)
                      ..rotateX(math.pi)
                      ..rotateY(math.pi),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: const Color(0xFFE8581C),
                      // child: const Text('Apartment for rent!'),
                      width: 200,
                      height: 200,
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
