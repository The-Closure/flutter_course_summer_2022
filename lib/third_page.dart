import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Center(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.black,
            ),
          ),
          Center(
            child: Container(
              height: 50,
              width: 50,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
