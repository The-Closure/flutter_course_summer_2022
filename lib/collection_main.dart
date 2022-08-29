import 'dart:convert';

import 'package:flutter_course_summer_2022/main.dart';

void main() {
  Person p = Person();
  p.firstName = 'dart';
  p.lastName = 'flutter';
  p.location = 'flutter.dev';
  p.age = 4;
  Map<String, dynamic> personData = p.toMap();
  String json = jsonEncode(personData);
  print(json);

  Map<String, dynamic> jsonMap = jsonDecode(json);
  Person p2 = Person.fromMap(data: jsonMap);
  print(p2.age);

  Mobile mobile = Mobile();
  mobile.imei = 32423423423423423;
  mobile.sn = 'sn-3242342342342342';
  mobile.msisdn = '+145435435345';
  mobile.owner = p2;
  Map<String, dynamic> mobileData = mobile.toMap();
  String mobileStr = jsonEncode(mobileData);
  print(mobileStr);

  Map<String, dynamic> mobileMap = jsonDecode(mobileStr);
  Mobile m1 = Mobile.fromMap(data: mobileMap);
  print(m1.sn);
  print(m1.owner?.age);
}
