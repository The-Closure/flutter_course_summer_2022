import 'package:flutter/material.dart';
import 'package:flutter_course_summer_2022/first_page.dart';
import 'package:flutter_course_summer_2022/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
      routes: {'/second_page': (_) => const SecondPage()},
    );
  }
}
