import 'package:flutter/material.dart';
import 'package:test_app2/model/user.dart';
import '../../services/api/api_users.dart';

class UsersBloc{
  ApiUsers _apiUsers = ApiUsers();
    final TextEditingController fnameCtrlr = TextEditingController();
  final TextEditingController mnameCtrlr = TextEditingController();
  final TextEditingController lnameCtrlr = TextEditingController();
  final TextEditingController addressCtrlr = TextEditingController();
  final TextEditingController emailCtrlr = TextEditingController();

  Future<dynamic> getUsers() async {
   return await _apiUsers.getUsers();
  }

  dynamic usersData;

  void setUpdateUser(dynamic _userData) {
    fnameCtrlr.text = _userData["fName"];
    mnameCtrlr.text = _userData["mName"];
    lnameCtrlr.text = _userData["lname"];
    addressCtrlr.text = _userData["address"];
    emailCtrlr.text = _userData["email"];
    usersData = _userData;
  }

  Future<String> updateUser() async {
    var data = {
      "recNo": usersData["recNo"],
      "userId": usersData["userId"],
      "fName": fnameCtrlr.text,
      "mName": mnameCtrlr.text,
      "lname": lnameCtrlr.text,
      "address": addressCtrlr.text,
      "birthDate": usersData["birthDate"],
      "email": emailCtrlr.text,
      "username": usersData["username"],
      "password": usersData["password"],
      "photoUrl": usersData["photoUrl"]
    };
    await _apiUsers.updateUser(data);

    return "OK";
  }


}