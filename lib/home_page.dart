import 'package:flutter/material.dart';
import 'package:flutter_course_summer_2022/register_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home screen'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (ctxt) {
                //   //
                //   //
                //   //
                //   return RegisterPage();
                // }));
                Navigator.of(context).pushNamed('/register');
              },
              child: const Text(
                'Register',
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              child: const Text(
                'login',
              ),
            ),
          )
        ]),
      ),
    );
  }
}
