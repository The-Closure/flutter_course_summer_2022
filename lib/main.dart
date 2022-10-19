import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_summer_2022/first_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatefulWidget {
  MyStatelessWidget({key});

  var _currentSliderValue = 0.0;
  @override
  State<MyStatelessWidget> createState() => _MyStatelessWidgetState();
}

class _MyStatelessWidgetState extends State<MyStatelessWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // use Row if you want to test VerticalDivider
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.amber,
              child: const Center(
                child: Text('Above'),
              ),
            ),
          ),
          const Divider(
            // you can use vertical divider with Row
            height: 40,
            thickness: 5,
            indent: 20,
            endIndent: 10,
            color: Colors.black,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctxt) => const FirstPage()));
                },
                child: Text(
                  'Subheader',
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          Slider(
            value: widget._currentSliderValue,
            max: 100,
            divisions: 100,
            label: widget._currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                widget._currentSliderValue = value;
              });
            },
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              child: const Center(
                child: Text('Below'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
