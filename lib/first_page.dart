import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff03dac6),
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  print('menu');
                }),
            Spacer(),
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: Center(child: Text('Hello FAB')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        // mini: true,
        foregroundColor: Colors.white,
        onPressed: () {
          final snackBar = SnackBar(
            duration: Duration(seconds: 10),
            behavior: SnackBarBehavior.floating,
            content: Text('Text label'),
            action: SnackBarAction(
              textColor: const Color(0xff03dac6),
              label: 'Action',
              onPressed: () {
                print('clicked');
              },
            ),
          );

          // Find the Scaffold in the widget tree and use
          // it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        // available only with extended type
        // label: Text(
        //   'show snackbar',
        //   style: TextStyle(fontSize: 20),
        // ),
        // icon: Icon(Icons.ads_click),
        // not available with extended type
        child: Icon(Icons.add),
      ),
    );
  }
}
