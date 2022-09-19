import 'package:flutter/material.dart';
import 'package:flutter_course_summer_2022/whatsapp_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const whatsappHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(
          0xFF128C7E,
          color,
        ),
      ),
    );
  }
}

Map<int, Color> color = {
  50: const Color.fromRGBO(37, 211, 102, .1),
  100: const Color.fromRGBO(37, 211, 102, .2),
  200: const Color.fromRGBO(37, 211, 102, .3),
  300: const Color.fromRGBO(37, 211, 102, .4),
  400: const Color.fromRGBO(37, 211, 102, .5),
  500: const Color.fromRGBO(37, 211, 102, .6),
  600: const Color.fromRGBO(37, 211, 102, .7),
  700: const Color.fromRGBO(37, 211, 102, .8),
  800: const Color.fromRGBO(37, 211, 102, .9),
  900: const Color.fromRGBO(37, 211, 102, 1),
};
