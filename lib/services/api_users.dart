import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_app2/model/user.dart';

class ApiUsers{
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://172.16.26.60/flutter-training/",
      connectTimeout: 1000 * 60,
      // headers: {
      //   "Access-Control-Allow-Origin": "*",
      //   "Access-Control-Allow-Methods": "GET,PUT,PATCH,POST,DELETE",
      //   "Access-Control-Allow-Headers": "Origin, X-Requested-With, Content-Type, Accept"
      // }
    )
  );

  Future<List<User>> getUsers() async {
    final path = "api/PersonalInfo/GetUser";
    try {
      final response = await _dio.get(path);
      var data = jsonDecode(response.data) as List;
      return data.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      throw e;
    }
  }
}