import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
            const Spacer(),
            Container(
              child: const FlutterLogo(
                size: 48,
              ),
              alignment: Alignment.center,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextFormField(
                validator: (phone) {
                  phone = "+44" + (phone ?? "");
                  String pattern =
                      r'^(\+\d{1,2}\s?)?1?\-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$';
                  RegExp regExp = new RegExp(pattern);
                  if (regExp.hasMatch(phone)) {
                    return null;
                  } else {
                    return "phone number is not correct";
                  }
                },
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  prefix: Text('+44'),
                  border: OutlineInputBorder(),
                  hintText: 'Phone Number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                validator: (password) {
                  String pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                  RegExp regExp = new RegExp(pattern);
                  if (regExp.hasMatch(password ?? "")) {
                    return null;
                  } else {
                    return "password should be at least 8 characters and special character and number";
                  }
                },
                controller: password,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    errorMaxLines: 3,
                    border: const OutlineInputBorder(),
                    hintText: 'Passowrd',
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.remove_red_eye,
                      ),
                      onPressed: () {},
                    )),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: ElevatedButton.icon(
                style: const ButtonStyle(),
                onPressed: () {
                  if (isValid()) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/welcome',
                      (route) => false,
                    );
                  }
                },
                label: const Text('sign in'),
                icon: const Icon(Icons.person),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Didn\'t have Account yet ?'),
                TextButton(
                  onPressed: () {},
                  child: const Text('sign up'),
                ),
              ],
            ),
            const Spacer(),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
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
