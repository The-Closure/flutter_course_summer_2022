import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: Colors.indigo,
            height: MediaQuery.of(context).size.height / 2,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          Container(
            color: Colors.indigo,
            height: MediaQuery.of(context).size.height / 2,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          Container(
            color: Colors.indigo,
            height: MediaQuery.of(context).size.height / 2,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        ]),
      ),
    );
  }
}
