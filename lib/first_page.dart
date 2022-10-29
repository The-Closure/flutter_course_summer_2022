//TAB BAR
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);

  final tabs = [
    'Taaaaaab 1',
    'Tab 2',
    'Tab 3',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length + 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Scrollable Tabs '),
          bottom: TabBar(
            onTap: (value) => print(value),
            indicatorColor: Colors.red,
            indicatorWeight: 5.0,
            // indicatorPadding: EdgeInsetsDirectional.only(bottom: 20),
            indicatorSize: TabBarIndicatorSize.tab, //lable: under text only
            isScrollable: true,
            //tabs same number of length
            tabs: [
              for (final tab in tabs)
                Tab(
                  text: tab,
                  icon: Icon(Icons.abc_outlined),
                ),
              Tab(
                text: "Story",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              height: 60,
              width: 60,
              color: Colors.blue,
            ),
            Container(
              height: 60,
              width: 60,
              color: Colors.yellow,
            ),
            Container(
              child: Text('Data'),
              color: Colors.brown,
            ),
            Container(
              height: 60,
              width: 60,
              color: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}
