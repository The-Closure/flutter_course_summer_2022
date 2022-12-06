import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_course_summer_2022/service/auth_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthService authService;
  AuthBloc(this.authService) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoadingAuth());
      try {
        String token = await authService.signIn(event.username, event.password);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('ID_TOKEN', token);
        emit(Authenticated());
      } on HttpException catch (e) {
        emit(FailedAuth(message: e.message));
      } on Exception catch (e) {
        emit(FailedAuth(message: e.toString().substring(10)));
      }
    });
  }
}
