import 'package:flutter/material.dart';
import 'package:flutter_course_summer_2022/ui/widgets/generator_button.dart';

class GeneratorWithValueWidget extends StatelessWidget {
  GeneratorWithValueWidget({Key? key, required this.value}) : super(key: key);
  String value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            shadowColor: Colors.grey,
            child: SizedBox(
              child: Center(
                child: Text(
                  value,
                  style: TextStyle(fontSize: 32, color: Colors.blue),
                ),
              ),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 3,
            ),
          ),
          GeneratorButton(),
        ],
      ),
    );
  }
}

