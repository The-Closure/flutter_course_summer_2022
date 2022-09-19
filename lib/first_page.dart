import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 25),
            decoration: BoxDecoration(color: Colors.yellow.shade600),
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              'assets/one.jpeg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              // opacity: ,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25),
            decoration: BoxDecoration(color: Colors.yellow.shade600),
            padding: const EdgeInsets.all(8),
            child: Image.network(
              'https://thumbs.dreamstime.com/z/sea-water-ocean-wave-surfing-surface-colorful-vibrant-sunset-barrel-shape-124362369.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              loadingBuilder: (ctxt, child, progress) {
                return (progress == null)
                    ? child
                    : Container(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                (MediaQuery.of(context).size.height / 6) - 10),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3,
                        child: const LinearProgressIndicator(
                          color: Colors.amber,
                          backgroundColor: Colors.yellow,
                        ),
                      );
              },
              // opacity: ,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
