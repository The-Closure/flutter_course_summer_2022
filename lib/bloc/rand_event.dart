part of 'rand_bloc.dart';

@immutable
abstract class RandEvent {}

class AskForNumber extends RandEvent {
  int? prevNumber;
  AskForNumber({this.prevNumber});
}
