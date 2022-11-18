import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_app2/services/api_acount.dart';

import '../../model/dto_credentials.dart';

class AccountBloc{

  ApiAccount _apiAccount = ApiAccount();

  final TextEditingController fnameCtrlr = TextEditingController();
  final TextEditingController mnameCtrlr = TextEditingController();
  final TextEditingController lnameCtrlr = TextEditingController();
  final TextEditingController addressCtrlr = TextEditingController();
  final TextEditingController emailCtrlr = TextEditingController();
  final TextEditingController usernameCtrlr = TextEditingController();
  final TextEditingController passwordCtrlr = TextEditingController();

  final StreamController<bool> isLoadingCtrlr = StreamController<bool>();
  Stream<bool> get streamLoading => isLoadingCtrlr.stream;
  Sink<bool> get sinkLoading => isLoadingCtrlr.sink;
  
  Future<String> register() async {
    await Future.delayed(Duration(seconds: 3));
    DtoCredentials _dto = DtoCredentials(
      fname: fnameCtrlr.text,
      mname: mnameCtrlr.text,
      lname: lnameCtrlr.text,
      address: addressCtrlr.text,
      email: emailCtrlr.text,
      username: usernameCtrlr.text,
      password: passwordCtrlr.text
    );

    return await _apiAccount.register(_dto);
  }

  Future<String> login() async {
    await Future.delayed(Duration(seconds: 3));
    return await _apiAccount.login(usernameCtrlr.text, passwordCtrlr.text);
  }

  void setLoading(bool event) {
    sinkLoading.add(event);
  }
}