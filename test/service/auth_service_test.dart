import 'dart:io';

import 'package:flutter_course_summer_2022/service/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test(
    'test succeed login',
    () async {
      AuthService authService = AuthServiceImpl(client: http.Client());
      expect(await authService.Login('admin', 'admin'), isA<String>());
    },
  );
  test(
    'test failed login',
    () async {
      AuthService authService = AuthServiceImpl(client: http.Client());
      expect(() async => await authService.Login('user', 'admin'),
          throwsA(isA<HttpException>()));
    },
  );
  test(
    'server down login',
    () async {
      AuthService authService = AuthServiceImpl(client: http.Client());
      expect(() async => await authService.Login('admin', 'admin'),
          throwsA(isA<Exception>()));
    },
  );
}
