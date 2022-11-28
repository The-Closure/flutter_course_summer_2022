import 'package:flutter/material.dart';

class LoadingGeneratorWidget extends StatelessWidget {
  LoadingGeneratorWidget({
    Key? key,
    required this.loadingPercentage,
  }) : super(key: key);
  int loadingPercentage;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Loading.....',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 32,
          ),
        ),
        Text(
          '$loadingPercentage%',
          style: TextStyle(fontSize: 32, color: Colors.blue),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: LinearProgressIndicator(
            value: loadingPercentage / 100,
            backgroundColor: Colors.grey,
            color: Colors.blue,
          ),
        ),
        // AnimatedContainer(
        //   color: Colors.blue,
        //   height: 100,
        //   duration: Duration(milliseconds: 500),
        //   width: MediaQuery.of(context).size.width /
        //       (10 - (loadingPercentage / 10)),
        // )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    ));
  }
}
