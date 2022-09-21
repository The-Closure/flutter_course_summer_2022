import 'dart:math';

import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  String article;
  SecondPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // backgroundColor: Colors.black,
      body: Container(
        height: 400,
        child: ListView(
          scrollDirection: Axis.horizontal,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _randomContainedText(context),
            _randomContainedText(context),
            _randomContainedText(context),
            _randomContainedText(context),
            _randomContainedText(context),
            _randomContainedText(context),
            _randomContainedText(context),
          ],
        ),
      ),
    );
  }

  List<TextSpan> _generateText() {
    List<String> chars = article.characters.toList();
    return chars
        .map(
          (e) => TextSpan(
            text: e,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: _generateColor(),
            ),
          ),
        )
        .toList();
  }

  Color _generateColor() {
    return Color.fromARGB(
      next(100, 255),
      next(0, 100),
      next(0, 150),
      next(0, 75),
    );
  }

  Widget _randomContainedText(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration:
          BoxDecoration(border: Border.all(color: _generateColor(), width: 3)),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView(children: [
        RichText(
          text: TextSpan(
            children: _generateText(),
          ),
        ),
      ]),
    );
  }
}

int next(int min, int max) => min + Random().nextInt(max - min);
