import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_summer_2022/bloc/rand_bloc.dart';

class GeneratorButton extends StatelessWidget {
  const GeneratorButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<RandBloc>(context).add(AskForNumber());
      },
      child: const Text(
        'Generate new Awesome number',
      ),
    );
  }
}
