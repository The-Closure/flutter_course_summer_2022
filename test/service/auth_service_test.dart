import 'dart:io';
import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_course_summer_2022/bloc/auth_bloc.dart';
import 'package:flutter_course_summer_2022/model/user_model.dart';
import 'package:flutter_course_summer_2022/service/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  AuthService authService = AuthServiceImpl(client: http.Client());
  UserModel? userModel;
  UserModel? badUserModel;
  initData() {
    userModel = UserModel(
        activated: false,
        createdBy: 'application',
        createdDate: '2022-11-21T16:21:18.056Z',
        email: 'anas${Random().nextInt(1000)}@gmail.com',
        firstName: 'anas',
        lastName: 'anas',
        imageUrl: '',
        langKey: 'ar',
        lastModifiedBy: 'application',
        lastModifiedDate: '2022-11-21T16:21:18.056Z',
        login: 'anas_tarazi${Random().nextInt(1000)}',
        authorities: ['ROLE_USER']);
    badUserModel = UserModel(
        activated: false,
        createdBy: 'application',
        createdDate: '2022-11-21T16:21:18.056Z',
        email: 'anas${Random().nextInt(1000)}',
        firstName: 'anas',
        lastName: 'anas',
        imageUrl: '',
        langKey: 'ar',
        lastModifiedBy: 'application',
        lastModifiedDate: '2022-11-21T16:21:18.056Z',
        login: 'anas_tarazi${Random().nextInt(1000)}',
        authorities: ['ROLE_USER']);
  }

  test('first simple unit test', () async {
    initData();
    UserModel result =
        await authService.register(userModel: userModel ?? UserModel());
    expect(result.id != null, true);
  });
  test('bad email format', () async {
    initData();
    expect(
        () async =>
            await authService.register(userModel: badUserModel ?? UserModel()),
        throwsA(isA<HttpException>()));
  });
  test('valid sign in', () async {
    expect(await authService.signIn('admin', 'admin'), isA<String>());
  });
  test('invalid sign in', () {
    expect(() async => await authService.signIn('admin', 'user'),
        throwsA(isA<HttpException>()));
  });
  test('server error sign in', () {
    expect(() async => await authService.signIn('admin', 'admin'),
        throwsA(isA<Exception>()));
  });
  
}
