import 'package:flutter/material.dart';
import 'package:flutter_course_summer_2022/home_page.dart';
import 'package:flutter_course_summer_2022/login_page.dart';
import 'package:flutter_course_summer_2022/register_page.dart';
import 'package:flutter_course_summer_2022/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        '/login': (_) => LoginPage(),
        '/register': (_) => const RegisterPage(),
        '/welcome': (_) => const WelcomePage()
      },
    );
  }
}
