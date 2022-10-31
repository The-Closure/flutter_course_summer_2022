import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  String _selectedMenu = '';
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<String> menu = ['itemOne', 'itemTwo', 'itemThree', 'itemFour'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
              // Callback that sets the selected popup menu item.
              onSelected: (String item) {
                print(item);
                setState(() {
                  widget._selectedMenu = item;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: menu[0],
                      child: Text('Item 1'),
                    ),
                    PopupMenuItem<String>(
                      value: menu[1],
                      child: Text('Item 2'),
                    ),
                    PopupMenuItem<String>(
                      value: menu[2],
                      child: Text('Item 3'),
                    ),
                    PopupMenuItem<String>(
                      value: menu[3],
                      child: Text('Item 4'),
                    ),
                  ]),
        ],
      ),
      body: Center(
          child: Column(
        children: [
          RawKeyboardListenerWidget(),
          DropdownButtonExample(),
        ],
      )),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({Key? key}) : super(key: key);

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  String dropdownValue = '';
  @override
  void initState() {
    dropdownValue = list.first;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        style: const TextStyle(color: Colors.deepPurple),
        elevation: 1,
        isExpanded: true,
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: ListTile(
              title: Text(value),
              leading: Icon(Icons.flight_sharp),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class RawKeyboardListenerWidget extends StatefulWidget {
  RawKeyboardListenerWidget();
  @override
  _RawKeyboardListenerState createState() => new _RawKeyboardListenerState();
}

class _RawKeyboardListenerState extends State {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _textNode = FocusNode();
  @override
  initState() {
    super.initState();
  }

  //Handle when submitting
  void _handleSubmitted(String finalinput) {
    setState(() {
      SystemChannels.textInput
          .invokeMethod('TextInput.hide'); //hide keyboard again
      _controller.clear();
    });
  }

  handleKey(RawKeyEventData key) {
    String _keyCode;
    _keyCode = key.keyLabel.toString(); //keycode of key event (66 is return)
    print(_keyCode);
  }

  Widget _buildTextComposer() {
    TextField _textField = TextField(
      decoration: const InputDecoration(
        hintText: "Enter name",
      ),
      controller: _controller,
      onSubmitted: _handleSubmitted,
    );
    FocusScope.of(context).requestFocus(_textNode);
    return RawKeyboardListener(
      focusNode: _textNode,
      onKey: (key) => handleKey(key.data),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: _textField,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTextComposer();
  }
}
