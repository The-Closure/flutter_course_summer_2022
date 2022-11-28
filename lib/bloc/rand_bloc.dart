import 'package:bloc/bloc.dart';
import 'package:flutter_course_summer_2022/utils/rand_generator.dart';
import 'package:meta/meta.dart';

part 'rand_event.dart';
part 'rand_state.dart';

class RandBloc extends Bloc<RandEvent, RandState> {
  RandGenerator randGenerator = RandGenerator();
  RandBloc() : super(RandInitial()) {
    on<AskForNumber>((event, emit) async {
      bool done = false;
      int prec = 0;
      emit(GeneratingRand());
      Future<int> randValue = randGenerator.generateBasedOnPrevNumber(
          prevNumber: event.prevNumber ?? 0);
      randValue.then((value) {
        done = true;
        emit(RandGenerated(value: value));
      });
      while (!done) {
        emit(GeneratingRand(loadPercentage: (prec += 20)));
        if (prec == 70) {
          emit(GeneratingRand(loadPercentage: 100));
          done = true;
        }
        await Future.delayed(Duration(milliseconds: 500));
      }
    });
  }
}
