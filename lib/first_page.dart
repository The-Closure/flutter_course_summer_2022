import 'dart:math';

import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  Color _generateColor() {
    return Color.fromARGB(
      next(100, 255),
      next(0, 100),
      next(0, 150),
      next(0, 75),
    );
  }

  int next(int min, int max) => min + Random().nextInt(max - min);

  FirstPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Textful(),
            Iconful(),
            Container(
              width: 100,
              height: 50,
              color: _generateColor(),
            )
          ],
        ),
      ),
    );
  }
}

class Textful extends StatefulWidget {
  Textful({
    Key? key,
  }) : super(key: key);
  int i = Random().nextInt(100);

  @override
  State<Textful> createState() => _TextfulState();
}

class _TextfulState extends State<Textful> {
  Color _generateColor() {
    return Color.fromARGB(
      next(100, 255),
      next(0, 100),
      next(0, 150),
      next(0, 75),
    );
  }

  int next(int min, int max) => min + Random().nextInt(max - min);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'counter ${widget.i}',
          style: const TextStyle(fontSize: 32, color: Colors.red),
        ),
        Container(
          width: 100,
          height: 50,
          color: _generateColor(),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              ++widget.i;
            });
          },
          child: const Text('count'),
        ),
      ],
    );
  }
}

class Iconful extends StatefulWidget {
  Iconful({
    Key? key,
  }) : super(key: key);
  bool status = false;

  @override
  State<Iconful> createState() => _IconfulState();
}

class _IconfulState extends State<Iconful> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          widget.status = !widget.status;
        });
      },
      icon: Icon(widget.status ? Icons.favorite : Icons.favorite_outline),
      color: Colors.red,
    );
  }
}
