import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  int i = 0;
  FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UK',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.plus_one)),
      body: Center(
        child: GestureDetector(
          child: Text(
            '2022-10-24 6:50:12',
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Colors.black),
          ),
          onTap: () {
            print('hello world ${i++}');
          },
          onLongPress: () {
            print('hello world ${i = i + 10}');
          },
        ),
      ),
    );
  }
}
