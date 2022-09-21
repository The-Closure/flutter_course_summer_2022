import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_course_summer_2022/first_page.dart';
import 'package:flutter_course_summer_2022/second_page.dart';
import 'package:lorem_gen/lorem_gen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SecondPage(
        article: Lorem.word(
          numWords: Random().nextInt(1000),
        ),
      ),
    );
  }
}
