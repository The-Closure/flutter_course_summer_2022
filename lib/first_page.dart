import 'package:flutter/material.dart';
import 'package:flutter_course_summer_2022/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctxt) => SecondPage()));
            },
            icon: Icon(Icons.navigate_next))
      ]),
      body: FristPageBody(),
    );
  }
}

class FristPageBody extends StatefulWidget {
  FristPageBody({
    Key? key,
  }) : super(key: key);
  String value = '1';
  List<bool> switchList = [true, false, true, false, true];
  List<bool?> checkList = [false, false, false, false];

  @override
  State<FristPageBody> createState() => _FristPageBodyState();
}

class _FristPageBodyState extends State<FristPageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: [
            for (var i = 0; i < 4; i += 1)
              Row(
                children: [
                  Checkbox(
                    onChanged: (bool? value) {
                      setState(() {
                        if (i == 0) {
                        } else {
                          widget.checkList[i] = value;
                          bool firstState = widget.checkList.contains(true);
                          bool secondState = widget.checkList
                                  .sublist(1)
                                  .every((element) => element == true) &&
                              firstState;
                          if (secondState) {
                            widget.checkList[0] = true;
                          } else if (firstState) {
                            widget.checkList[0] = null;
                          } else {
                            widget.checkList[0] = false;
                          }
                        }
                      });
                    },
                    tristate: i == 0,
                    value: widget.checkList[i],
                    activeColor: Color(0xFF6200EE),
                  ),
                  Text(
                    'Checkbox ${i + 1}',
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
          ],
        ),
        for (int i = 0; i <= 3; i++)
          ListTile(
            title: Text(
              'Switch ${i + 1}',
            ),
            leading: Switch(
              value: widget.switchList[i],
              activeColor: Color(0xFF6200EE),
              onChanged: (bool value) {
                setState(() {
                  widget.switchList[i] = value;
                });
              },
            ),
          ),
        for (int i = 1; i <= 3; i++)
          ListTile(
            title: Text(
              'Radio $i',
            ),
            leading: Radio(
              value: i.toString(),
              groupValue: widget.value,
              activeColor: Color(0xFF6200EE),
              onChanged: i == 5
                  ? null
                  : (value) {
                      setState(() {
                        widget.value = value.toString();
                      });
                    },
            ),
          ),
      ],
    );
  }
}
