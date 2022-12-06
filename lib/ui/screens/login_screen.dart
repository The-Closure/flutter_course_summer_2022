import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_summer_2022/bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.of(context).pushNamed('/home');
          }
        },
        builder: (context, state) {
          if (state is AuthInitial) {
            return Center(
                child: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(controller: usernameController),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                    ),
                    ElevatedButton(
                        child: const Text(
                          'login',
                        ),
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context).add(
                            LoginEvent(
                              password: passwordController.text,
                              username: usernameController.text,
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ));
          } else if (state is LoadingAuth) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FailedAuth) {
            return Center(
                child: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '${state.message}',
                      style: TextStyle(color: Colors.red),
                    ),
                    ElevatedButton(
                        child: const Text(
                          'login',
                        ),
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context).add(
                            LoginEvent(
                              password: passwordController.text,
                              username: usernameController.text,
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ));
          } else {
            return Center(
              child: Text(
                'something went wrong',
              ),
            );
          }
        },
      ),
    );
  }
}
