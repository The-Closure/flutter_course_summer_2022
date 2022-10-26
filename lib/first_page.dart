import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_course_summer_2022/second_page.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);
  double skewY = 0.0;
  double containerSize = 50;
  bool containerState = true;
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
      body: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctxt) => SecondPage(),
            ),
          ),
          child: StreamBuilder<void>(
              stream: rotatePercentage(),
              builder: (context, snapshot) {
                if (containerState) {
                  if (MediaQuery.of(context).size.width - 50 > containerSize) {
                    containerSize = containerSize + 2;
                    // containerState = !containerState;
                  } else {
                    containerSize = containerSize - 2;
                    containerState = !containerState;
                  }
                } else {
                  if (75 > containerSize) {
                    containerSize = containerSize + 2;
                    containerState = !containerState;
                  } else {
                    containerSize = containerSize - 2;
                    // containerState = !containerState;
                  }
                }

                return Hero(
                  tag: 'rotatual element',
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.skewX(0)
                      ..rotateZ((containerState ? skewY : -skewY) * math.pi)
                      ..rotateX(math.pi)
                      ..rotateY(math.pi),
                    child: AnimatedAlign(
                      alignment: containerState
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      duration: Duration(milliseconds: 1000),
                      child: AnimatedContainer(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.red,
                        // child: const Text('Apartment for rent!'),
                        width: containerSize,

                        height: containerSize,
                        duration: const Duration(milliseconds: 5),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
