import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            child: FlutterLogo(
              size: 48,
            ),
            alignment: Alignment.center,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              controller: phone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefix: Text('+44 '),
                border: OutlineInputBorder(),
                hintText: 'Phone Number',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: password,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Passowrd',
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                    ),
                    onPressed: () {},
                  )),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: ElevatedButton.icon(
              style: ButtonStyle(),
              onPressed: () {
                print(
                    'phone number : ${phone.text}\npassword : ${password.text}');
                phone.clear();
                password.clear();
              },
              label: Text('sign in'),
              icon: Icon(Icons.person),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Didn\'t have Account yet ?'),
              TextButton(
                onPressed: () {},
                child: Text('sign up'),
              ),
            ],
          ),
          Spacer(),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              'poweredBy The-Closure',
              style: TextStyle(fontSize: 8),
            ),
          )
        ],
      )),
    );
  }
}
