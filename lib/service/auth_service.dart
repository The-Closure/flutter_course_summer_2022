import 'dart:convert';
import 'dart:io';

import 'package:flutter_course_summer_2022/common/consts.dart';
import 'package:http/http.dart' as http;

abstract class AuthService {
  http.Client client;
  AuthService({required this.client});
  Future<String> Login(String username, String password);
}

class AuthServiceImpl extends AuthService {
  AuthServiceImpl({required http.Client client}) : super(client: client);

  @override
  Future<String> Login(String username, String password) async {
    final response = await client.post(Uri.parse('$API_HOST/authenticate'),
        body: jsonEncode(
            {'username': username, 'password': password, 'rememberMe': true}),headers: {
              'Content-Type': 'application/json',
              'Accept': '*/*'
            });
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['id_token'];
    } else if (response.statusCode == 401) {
      throw HttpException(jsonDecode(response.body)['detail']);
      // return jsonDecode(response.body)['details'];
    } else {
      throw Exception('general failure');
      // return 'general failure';
    }
  }
}
