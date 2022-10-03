import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  // GlobalKey<FormFieldState> fieldKey = GlobalKey();
  bool isValid() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Form(
        key: formKey,
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
              child: TextFormField(
                validator: (phone) {
                  if ((phone?.length ?? 0) < 8)
                    return 'please enter a phone number';
                  return null;
                },
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
              child: TextFormField(
                validator: (password) {
                  if ((password?.length ?? 0) < 3)
                    return 'please enter a password';
                  return null;
                },
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
                  if (isValid()) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/welcome',
                      (route) => false,
                    );
                  }
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
        ),
      )),
    );
  }
}
