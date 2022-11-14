import 'package:flutter/material.dart';
import 'package:flutter_course_summer_2022/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  ThemeData lightTheme() {
    return ThemeData().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black);
  }

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
