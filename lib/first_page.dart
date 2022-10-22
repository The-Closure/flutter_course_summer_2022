import 'dart:math';

import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  Color randomAccentColor() => Colors.accents[Random().nextInt(15)];

  Stream<Color> asyncItemColor(int delay) async* {
    while (true) {
      await Future.delayed(Duration(milliseconds: delay));
      yield Colors.accents[Random().nextInt(15)];
    }
  }

  Future<List<Color>> randomGridColors(int len) async {
    List<Color> colors = [];
    int colorsGroups = (len / 16).ceil();
    for (var i = 0; i < colorsGroups; i++) {
      await Future.delayed(Duration(seconds: 1));
      List<Color> subColors = Colors.accents.toList(growable: true);
      subColors.shuffle();
      colors.addAll(subColors);
    }
    return colors;
  }

  Widget gridViewItemBuilder(BuildContext ctxt, int index) => Container(
      width: MediaQuery.of(ctxt).size.width / 4, color: randomAccentColor());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Color>>(
        future: randomGridColors(100),
        builder: (ctxt, asyncSnapshot) => !asyncSnapshot.hasData
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                // crossAxisCount: 4,
                // mainAxisSpacing: 5,
                // crossAxisSpacing: 5,
                itemBuilder: (ctxt, index) => StreamBuilder<Color>(
                    stream: asyncItemColor(Random().nextInt(900) + 100),
                    builder: (context, snapshot) {
                      return Container(
                          width: MediaQuery.of(context).size.width / 4,
                          // color: asyncSnapshot.data?[index],
                          color: snapshot.data);
                    }),
                itemCount: 100,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, crossAxisSpacing: 5, mainAxisSpacing: 5),

                // children: [
                //   Container(
                //     width: MediaQuery.of(context).size.width / 4,
                //     color: Colors.black,
                //   ),
                //   Container(
                //     width: MediaQuery.of(context).size.width / 4,
                //     color: Colors.blue,
                //   ),

                //   Container(
                //     width: MediaQuery.of(context).size.width / 4,
                //     color: Colors.deepOrange,
                //   ),

                //   Container(
                //     width: MediaQuery.of(context).size.width / 4,
                //     color: Colors.orange,
                //   ),
                //   Container(
                //     width: MediaQuery.of(context).size.width / 4,
                //     color: Colors.deepPurpleAccent,
                //   ),
                //   Container(
                //     width: MediaQuery.of(context).size.width / 4,
                //     color: Colors.deepOrange,
                //   ),
                // ],
              ),
      ),
    );
  }
}
