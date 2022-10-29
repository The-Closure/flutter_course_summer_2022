import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_course_summer_2022/first_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemBuilder: (context, _) => Dismissible(
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(content: Text('this is archive obkj')),
              // );
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FirstPage(),
                ),
              );
            }
          },
          secondaryBackground: Container(
            padding: const EdgeInsetsDirectional.only(end: 20),
            color: Colors.orange,
            child: const Icon(
              Icons.archive,
              color: Colors.white,
            ),
            alignment: Alignment.centerRight,
          ),
          background: Container(
            padding: const EdgeInsetsDirectional.only(start: 20),
            color: Colors.green,
            child: const Icon(
              Icons.call,
              color: Colors.white,
            ),
            alignment: Alignment.centerLeft,
          ),
          key: ObjectKey(
            Random().nextInt(1000),
          ),
          child: Container(
            color: Colors.redAccent,
            height: 100,
          ),
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10,
      ),
    );
  }
}
