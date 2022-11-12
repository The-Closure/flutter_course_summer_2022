import 'dart:convert';

import 'package:flutter_course_summer_2022/model/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthService {
  http.Client client;
  AuthService({required this.client});

  Future<UserModel> register({required UserModel userModel});
  Future<void> signIn();
  Future<void> logout();
  Future<void> resetPassword();
}

class AuthServiceImpl extends AuthService {
  AuthServiceImpl({required http.Client client}) : super(client: client);

  @override
  Future<UserModel> register({required UserModel userModel}) async {
    http.Response response = await client.post(
      Uri.parse(
        'http://192.168.68.41:8082/api/admin/users',
      ),
      body: jsonEncode(userModel.toJson()),
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
      },
    );

    if (response.statusCode == 201) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(jsonDecode(response.body)['title']);
    }
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword() {
    throw UnimplementedError();
  }

  @override
  Future<void> signIn() {
    throw UnimplementedError();
  }
}
