import 'dart:convert';

import 'package:flutter_course_summer_2022/const_data.dart';
import 'package:flutter_course_summer_2022/repo_model.dart';

void main() {
  List<dynamic> jsonData = jsonDecode(data);
  List<Repo> repos = jsonData.map((e) => Repo.fromJson(e)).toList();
  repos.forEach((element) {
    print(jsonEncode(element.toJson()));
  });
}
