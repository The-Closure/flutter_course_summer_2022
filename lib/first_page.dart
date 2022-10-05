import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 4,
                  ),
                  // color: Colors.red,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/second_page');
                    },
                    child: Text('data'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.indigo),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: [Text('data')],
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: [Text('data')],
            ),
          ),
        ],
      ),
    );
  }
}
