// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, // disabled effect because column contains spacer widget
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 25,
              ),
              FlutterLogo(
                size: 50,
                curve: Curves.easeInBack,
              ),
              Spacer(), // this widget will disable MainAxisAlignment effect
              FlutterLogo(
                size: 50,
                curve: Curves.easeInBack,
              ),
              Spacer(),
              Spacer(),
              Spacer(),
              FlutterLogo(
                size: 100,
                curve: Curves.easeInBack,
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
