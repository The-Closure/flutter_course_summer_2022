part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  String username;
  String password;
  LoginEvent({required this.password, required this.username});
}
