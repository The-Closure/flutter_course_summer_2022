import 'package:flutter/material.dart';
import 'package:flutter_course_summer_2022/constants.dart';
import 'package:flutter_course_summer_2022/contact_card.dart';

class whatsappHomePage extends StatelessWidget {
  const whatsappHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WhatsApp',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 28,
            ),
          ),
          Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 28,
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            height: 48.0,
            alignment: Alignment.center,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Padding(padding: EdgeInsets.only(right: 8)),
                Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                Spacer(),
                Text(
                  'CHATS',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                Spacer(),
                Spacer(),
                Text(
                  'STATUS',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                Spacer(),
                Spacer(),
                Text(
                  'CALLS',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          ContactCard(
              contact: 'Flutter bn Dart',
              unreadMessaged: 0,
              image: imageUrl,
              date: '6:42 PM',
              message: 'hello flutter can I ask you ?'),
          ContactCard(
              contact: 'Flutter bn Dart',
              unreadMessaged: 3,
              image: imageUrl,
              date: '6:42 PM',
              message: 'hello flutter can I ask you ?'),
          ContactCard(
              contact: 'Flutter bn Dart',
              unreadMessaged: 3,
              date: '6:42 PM',
              message: 'hello flutter can I ask you ?'),
          ContactCard(
              contact: 'Flutter bn Dart',
              unreadMessaged: 0,
              date: '6:42 PM',
              message: 'hello flutter can I ask you ?'),
        ],
      ),
    );
  }
}
