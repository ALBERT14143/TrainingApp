import 'package:test_app2/model/user.dart';
import 'package:test_app2/services/api_users.dart';

class UsersBloc{
  ApiUsers _apiUsers = ApiUsers();

  Future<List<User>> getUsers() async {
   return await _apiUsers.getUsers();
  }
}