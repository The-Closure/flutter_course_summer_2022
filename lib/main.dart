import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Flutter Beta Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List users = [];
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void fetchUsers() {
    FirebaseFirestore.instance.collection("users").get().then((value) {
      for (var u in value.docs) {
        users.add(u.data());
      }
      if (users.isNotEmpty) {
        setState(() {
          users = users;
        });
      }
    });
  }

  Future<void> _saveNewDoc() async {
    // Create a storage reference from our app
    final storageRef = FirebaseStorage.instance.ref();

// Create a reference to "mountains.jpg"
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final mountainsRef = storageRef.child(result.files.single.name);
      File file = File(result.files.single.path ?? '');
      try {
        String url =
            await (await mountainsRef.putFile(file)).ref.getDownloadURL();
        final user = <String, dynamic>{
          "first": "Alan",
          "middle": "Mathison",
          "last": "Turing",
          "img": url,
          "born": 1912
        };

        final db = FirebaseFirestore.instance;
        db
            .collection("users")
            .add(user)
            .then((value) => print('doc id is : ${value.id}'));
        setState(() {});
      } catch (e) {
        print('----------------${e}');
      }
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                users.clear();
                fetchUsers();
              },
              icon: Icon(Icons.refresh))
        ],
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Container(
                  child: ListTile(
                leading: users[index].keys.contains('img')
                    ? Image.network(
                        users[index]['img'],
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return FlutterLogo();
                        },
                      )
                    : FlutterLogo(),
                title: Text(users[index]['first']),
                subtitle: Text(users[index]['last']),
              )),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveNewDoc,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
