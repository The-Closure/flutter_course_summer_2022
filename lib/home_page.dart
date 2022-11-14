import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  String _value = 'one';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: unnecessary_new
      appBar: new AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message,
            ),
          ),
        ],
        title: new Theme(
          child: new DropdownButtonHideUnderline(
            child: new DropdownButton<String>(
              value: _value,
              items: <DropdownMenuItem<String>>[
                new DropdownMenuItem(
                  child: new Text('My Page'),
                  value: 'one',
                ),
                new DropdownMenuItem(
                  child: new Text('My Page'),
                  value: 'two',
                ),
              ],
              onChanged: (String? value) {},
            ),
          ),
          data: new ThemeData.dark(),
        ),
      ),
    );
  }
}
