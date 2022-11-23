import 'dart:convert';

import 'package:flutter_course_summer_2022/model/user_model.dart';

final mockRegisterResponseModel = '''{
  "id" : 11,
  "login": "string5",
  "firstName": "string",
  "lastName": "string",
  "email": "anas.tar5@gmail.com",
  "imageUrl": "string",
  "activated": true,
  "langKey": "en",
  "createdBy": "string",
  "createdDate": "2022-11-12T15:51:12.152Z",
  "lastModifiedBy": "string",
  "lastModifiedDate": "2022-11-12T15:51:12.152Z",
  "authorities": ["ROLE_ADMIN"]
}''';

final userModel = UserModel.fromJson(<String,dynamic>{
  "login": "string5",
  "firstName": "string",
  "lastName": "string",
  "email": "anas.tar5@gmail.com",
  "imageUrl": "string",
  "activated": true,
  "langKey": "en",
  "createdBy": "string",
  "createdDate": "2022-11-12T15:51:12.152Z",
  "lastModifiedBy": "string",
  "lastModifiedDate": "2022-11-12T15:51:12.152Z",
  "authorities": <String>["ROLE_ADMIN"]
});
