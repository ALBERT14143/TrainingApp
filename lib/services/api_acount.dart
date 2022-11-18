import 'package:dio/dio.dart';
import 'package:test_app2/model/dto_credentials.dart';

class ApiAccount{
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

  Future<String> register(DtoCredentials dto) async {
    final String path = "api/PersonalInfo/PostUser";
    try {
      final response = await _dio.post(path, data: dto.toJson());
      return response.data.toString();
    } catch (e) {
      throw e;
    }
  }

  Future<String> login(String username, String password) async {
    final String path = "api/Account/Login";
    Map<String, dynamic> credential = {
      "Username": username,
      "Password": password
    };

    try {
      final response = await _dio.post(path, data: credential);
      print(response.data.toString());
      return response.data.toString();
    } catch (e) {
      throw e;
    }
  }
}