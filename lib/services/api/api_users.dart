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

  Future<dynamic> getUsers() async {
    final path = "api/PersonalInfo/GetUser";
    try {
      final response = await _dio.get(path);
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Future<String> updateUser(Map<String, dynamic> data) async {
    final path = "api/PersonalInfo/UpdateUser";
    try {
      final response = await _dio.put(path, data: data);
      return response.data.toString();
    } catch (e) {
      throw e;
    }
  }

  Future<String> deleteUser(int recNo) async {
    final path = "api/PersonalInfo/UpdateUser?recNo?=$recNo";
    try {
      final response = await _dio.delete(path);
      return response.data.toString();
    } catch (e) {
      throw e;
    }
  }
}