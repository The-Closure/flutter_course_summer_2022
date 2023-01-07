import 'package:flutter/material.dart';
import 'package:flutter_course_summer_2022/whatsapp_home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      locale: _locale,
      home: whatsappHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(
          0xFF128C7E,
          color,
        ),
      ),
    );
  }
}

Map<int, Color> color = {
  50: const Color.fromRGBO(37, 211, 102, .1),
  100: const Color.fromRGBO(37, 211, 102, .2),
  200: const Color.fromRGBO(37, 211, 102, .3),
  300: const Color.fromRGBO(37, 211, 102, .4),
  400: const Color.fromRGBO(37, 211, 102, .5),
  500: const Color.fromRGBO(37, 211, 102, .6),
  600: const Color.fromRGBO(37, 211, 102, .7),
  700: const Color.fromRGBO(37, 211, 102, .8),
  800: const Color.fromRGBO(37, 211, 102, .9),
  900: const Color.fromRGBO(37, 211, 102, 1),
};
