import 'dart:convert';

import 'package:flutter_course_summer_2022/consts.dart';
import 'package:flutter_course_summer_2022/model/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthService {
  http.Client client;
  AuthService({required this.client});

  Future<UserModel> register({required UserModel userModel});
  Future<void> signIn();
  Future<void> initResetPassword(String mail);
  Future<void> deleteBrandById(int id);
}

class AuthServiceImpl extends AuthService {
  AuthServiceImpl({required http.Client client}) : super(client: client);

  @override
  Future<UserModel> register({required UserModel userModel}) async {
    http.Response response = await client.post(
      Uri.parse(
        'http://aws-us01.my-app-course.com/api/admin/users',
      ),
      body: jsonEncode(userModel.toJson()),
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': "Bearer $TOKEN"
      },
    ).timeout(Duration(seconds: 1));

    if (response.statusCode == 201) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(jsonDecode(response.body)['title']);
    }
  }

  @override
  Future<void> initResetPassword(String mail) async {
    http.Response response = await client.post(
        Uri.parse(
          'http://aws-us01.my-app-course.com/api/account/reset-password/init',
        ),
        headers: {
          'Content-Type': 'application/text',
          'Accept': '*/*',
          'Authorization': 'Bearer $TOKEN'
        },
        body: mail);

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<void> signIn() {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBrandById(int id) async {
    http.Response response = await client.delete(
        Uri.parse('http://aws-us01.my-app-course.com/api/brands/$id'),
        headers: {'Authorization': 'Bearer $TOKEN'});
    if (response.statusCode == 204) {
      return;
    } else {
      throw Exception(response.body);
    }
  }
}
