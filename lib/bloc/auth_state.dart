part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoadingAuth extends AuthState {}

class Authenticated extends AuthState {}

class FailedAuth extends AuthState {
  String message;
  FailedAuth({required this.message});
}
