// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text('Page title'),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            Icon(Icons.favorite),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.search),
            ),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Colors.teal.shade800,
        ),
        body: Center(
          child: Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: Colors.indigo,
              boxShadow: [
                BoxShadow(color: Colors.black, blurRadius: 50),
                BoxShadow(color: Colors.blue, blurRadius: 100),
              ],
              gradient: LinearGradient(
                colors: [Colors.grey, Colors.teal, Colors.black],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                // stops: [10, 10, 10, 10]
                // tileMode: TileMode.mirror // not working in this code !!!
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  30,
                ),
              ),
              border: Border.all(
                color: Colors.cyan,
                width: 8,
                style: BorderStyle.solid,
              ),
            ),
            padding: EdgeInsets.only(top: 160),
            // color: Colors.indigo, //don't use this prop when use decoration prop
            child: Text(
              'hello world',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
