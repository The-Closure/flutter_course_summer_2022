part of 'rand_bloc.dart';

@immutable
abstract class RandState {}

class RandInitial extends RandState {}

class GeneratingRand extends RandState {
  int loadPercentage;
  GeneratingRand({this.loadPercentage = 0});
}

class RandGenerated extends RandState {
  int value;
  RandGenerated({required this.value});
}
