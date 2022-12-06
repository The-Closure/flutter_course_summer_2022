import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_summer_2022/bloc/auth_bloc.dart';
import 'package:flutter_course_summer_2022/consts.dart';
import 'package:flutter_course_summer_2022/model/user_model.dart';
import 'package:flutter_course_summer_2022/service/auth_service.dart';
import 'package:flutter_course_summer_2022/ui/screens/home_screen.dart';
import 'package:flutter_course_summer_2022/ui/screens/login_screen.dart';
import 'package:http/http.dart' as http;

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => AuthBloc(
          AuthServiceImpl(
            client: http.Client(),
          ),
        ),
        child: Container(),
      )
    ], child: const MyMaterialApp());
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      // initialRoute: condition ? '/login' : '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen()
      },
    );
  }
}
