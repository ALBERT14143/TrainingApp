import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_app2/services/shared/share_accoun.dart';

import '../../model/dto_credentials.dart';
import '../../services/api/api_acount.dart';

class AccountBloc{

  ApiAccount _apiAccount = ApiAccount();
  SharedAccount sharedAccount = SharedAccount();

  final TextEditingController fnameCtrlr = TextEditingController();
  final TextEditingController mnameCtrlr = TextEditingController();
  final TextEditingController lnameCtrlr = TextEditingController();
  final TextEditingController addressCtrlr = TextEditingController();
  final TextEditingController emailCtrlr = TextEditingController();
  final TextEditingController usernameCtrlr = TextEditingController();
  final TextEditingController passwordCtrlr = TextEditingController();

  final StreamController<bool> isLoadingCtrlr = StreamController<bool>.broadcast();
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

  Future<void> setSharedAccount(String userData) async {
    await sharedAccount.setUserAccount(userData);
  }

  Future<bool> checkUserExist() async {
    await Future.delayed(Duration(seconds: 3));
    return await sharedAccount.checkUserExist();
  }

  Future<bool> removeAccount() async {
    return await sharedAccount.removeUserAccount();
  }
}