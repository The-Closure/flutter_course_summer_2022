import 'package:flutter/material.dart';
import 'package:flutter_course_summer_2022/constants.dart';
import 'package:flutter_course_summer_2022/contact_card.dart';
import 'package:flutter_course_summer_2022/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class whatsappHomePage extends StatelessWidget {
  whatsappHomePage({Key? key}) : super(key: key);
  bool lang = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.whatsapp,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 28,
            ),
          ),
          const Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 28,
          ),
          IconButton(
              onPressed: () {
                lang = !lang;
                lang
                    ? MyApp.of(context)!.setLocale(const Locale('en'))
                    : MyApp.of(context)!.setLocale(const Locale('ar'));
                  
              },
              icon: const Icon(Icons.language))
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            height: 48.0,
            alignment: Alignment.center,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(padding: EdgeInsets.only(right: 8)),
                const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                const Spacer(),
                Text(
                  AppLocalizations.of(context)!.chat,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                const Spacer(),
                const Spacer(),
                Text(
                  AppLocalizations.of(context)!.status,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                const Spacer(),
                const Spacer(),
                Text(
                  AppLocalizations.of(context)!.call,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                const Spacer(),
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
              date: '6:42 pm}',
              message: 'hello flutter can I ask you ?'),
          ContactCard(
              contact: 'Flutter bn Dart',
              unreadMessaged: 3,
              image: imageUrl,
              date: '6:42 PM}',
              message: 'hello flutter can I ask you ?'),
          ContactCard(
              contact: 'Flutter bn Dart',
              unreadMessaged: 3,
              date: '6:42 PM}',
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
