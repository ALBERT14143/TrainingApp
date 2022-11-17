import 'package:dio/dio.dart';
import 'package:test_app2/model/dto_credentials.dart';

class ApiRegistration{
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.8.113/flutter-training/",
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
}