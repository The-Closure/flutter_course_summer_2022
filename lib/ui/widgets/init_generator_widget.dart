import 'package:flutter/material.dart';
import 'package:flutter_course_summer_2022/ui/widgets/generator_button.dart';

class InitGeneratorWidget extends StatelessWidget {
  const InitGeneratorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: GeneratorButton());
  }
}
