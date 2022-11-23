// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course_summer_2022/consts.dart';
import 'package:flutter_course_summer_2022/model/user_model.dart';
import 'package:flutter_course_summer_2022/service/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_course_summer_2022/main.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'consts.dart';
import 'widget_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('mock register function', () async {
    final client = MockClient();
    when(
      client.post(
          Uri.parse(
            'http://aws-us01.my-app-course.com/api/admin/users',
          ),
          body: jsonEncode(userModel.toJson()),
          headers: {
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'Authorization': 'Bearer $TOKEN'
          }),
    ).thenAnswer((_) async => http.Response(mockRegisterResponseModel, 201));
    AuthService authService = AuthServiceImpl(client: client);
    expect(await authService.register(userModel: userModel), isA<UserModel>());
  });
}
