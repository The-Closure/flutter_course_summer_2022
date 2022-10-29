import 'package:flutter/material.dart';
import 'package:flutter_course_summer_2022/second_page.dart';
import 'package:flutter_course_summer_2022/third_page.dart';

import 'first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ThirdPage(),
    );
  }
}
