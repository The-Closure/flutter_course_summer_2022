import 'package:flutter/material.dart';
import 'package:flutter_course_summer_2022/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fontData = MediaQuery.of(context).textScaleFactor;
    return MaterialApp(
      home: FirstPage(),
      theme: lightTheme(),
    );
  }

  ThemeData lightTheme() {
    return ThemeData(primarySwatch: Colors.indigo).copyWith(
        primaryColor: Colors.indigo,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.indigo.shade300),
        useMaterial3: true,
        appBarTheme: AppBarTheme(backgroundColor: Colors.indigo),
        textTheme: TextTheme(
            headline6: TextStyle().copyWith(color: Colors.white),
            headline1: TextStyle(
                fontSize: 16, color: Colors.red, fontWeight: FontWeight.w400)));
  }
}
