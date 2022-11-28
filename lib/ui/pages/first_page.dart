import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_summer_2022/bloc/rand_bloc.dart';
import 'package:flutter_course_summer_2022/ui/widgets/generator_button.dart';
import 'package:flutter_course_summer_2022/ui/widgets/generator_with_value_widget.dart';
import 'package:flutter_course_summer_2022/ui/widgets/init_generator_widget.dart';
import 'package:flutter_course_summer_2022/ui/widgets/loading_generator_widget.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('awesome generator'),
      ),
      body: BlocBuilder<RandBloc, RandState>(
        builder: (context, state) {
          if (state is RandInitial) {
            return const InitGeneratorWidget();
          } else if (state is GeneratingRand) {
            return LoadingGeneratorWidget(
              loadingPercentage: state.loadPercentage,
            );
          } else if (state is RandGenerated) {
            return GeneratorWithValueWidget(value: state.value.toString());
          } else {
            return const InitGeneratorWidget();
          }
        },
      ),
    );
  }
}
