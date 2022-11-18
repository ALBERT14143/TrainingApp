import 'package:flutter/material.dart';
import 'package:test_app2/services/api_registration.dart';

import '../../model/dto_credentials.dart';

class RegistrationBloc{

  ApiRegistration _apiRegistration = ApiRegistration();

  final TextEditingController fnameCtrlr = TextEditingController();
  final TextEditingController mnameCtrlr = TextEditingController();
  final TextEditingController lnameCtrlr = TextEditingController();
  final TextEditingController addressCtrlr = TextEditingController();
  final TextEditingController emailCtrlr = TextEditingController();
  final TextEditingController usernameCtrlr = TextEditingController();
  final TextEditingController passwordCtrlr = TextEditingController();
  
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

    return await _apiRegistration.register(_dto);
  }
}