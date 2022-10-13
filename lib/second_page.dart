import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChipsBody(),
    );
  }
}

class ChipsBody extends StatefulWidget {
  ChipsBody({Key? key}) : super(key: key);

  @override
  _ChipsBodyState createState() => _ChipsBodyState();
}

class _ChipsBodyState extends State<ChipsBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InputChip(
              avatar: Icon(Icons.remove),
              label: Text('Input 1'),
              onSelected: (bool value) {},
            ),
            InputChip(
              avatar: Icon(Icons.remove),
              label: Text('Input 2'),
              onSelected: (bool value) {},
            ),
            InputChip(
              avatar: Icon(Icons.remove),
              label: Text('Input 3'),
              onSelected: (bool value) {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ChoiceChip(
              label: Text('Choice 1'),
              selected: true,
            ),
            ChoiceChip(
              label: Text('Choice 2'),
              selected: false,
            ),
            ChoiceChip(
              label: Text('Choice 3'),
              selected: false,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FilterChip(
              label: Text('Filter 1'),
              selected: true,
              onSelected: (bool value) {},
            ),
            FilterChip(
              label: Text('Filter 2'),
              onSelected: (bool value) {},
            ),
            FilterChip(
              label: Text('Filter 3'),
              selected: true,
              onSelected: (bool value) {},
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ActionChip(
              avatar: Icon(Icons.favorite),
              label: Text('Action 1'),
              onPressed: () {},
            ),
            ActionChip(
              avatar: Icon(Icons.delete),
              label: Text('Action 2'),
              onPressed: () {},
            ),
            ActionChip(
              avatar: Icon(Icons.alarm),
              label: Text('Action 3'),
              onPressed: () {},
            )
          ],
        ),
      ],
    );
  }
}
