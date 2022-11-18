import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_app2/components/app_textfield.dart';
import 'package:test_app2/model/dto_credentials.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_app2/services/api_registration.dart';

import '../components/app_button.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  ApiRegistration apiRegistration = ApiRegistration();
  bool? isLoading;
  @override
  void initState() {
    isLoading = false;
    super.initState();
  }
  final TextEditingController fnameCtrlr = TextEditingController();
  final TextEditingController mnameCtrlr = TextEditingController();
  final TextEditingController lnameCtrlr = TextEditingController();
  final TextEditingController addressCtrlr = TextEditingController();
  final TextEditingController emailCtrlr = TextEditingController();
  final TextEditingController usernameCtrlr = TextEditingController();
  final TextEditingController passwordCtrlr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                AppTextField(
                  controller: fnameCtrlr, 
                  hintText: "First name", 
                  preffix: Icon(Icons.person)
                ),
                AppTextField(
                  controller: mnameCtrlr, 
                  hintText: "Middle name", 
                  preffix: Icon(Icons.person)
                ),
                AppTextField(
                  controller: lnameCtrlr, 
                  hintText: "Last name", 
                  preffix: Icon(Icons.person)
                ),
                AppTextField(
                  controller: addressCtrlr, 
                  hintText: "Address", 
                  preffix: Icon(Icons.pin_drop_outlined)
                ),
                AppTextField(
                  controller: emailCtrlr, 
                  hintText: "Email", 
                  preffix: Icon(Icons.alternate_email_outlined)
                ),
                AppTextField(
                  controller: usernameCtrlr, 
                  hintText: "Username", 
                  preffix: Icon(Icons.person)
                ),
                AppTextField(
                  controller: passwordCtrlr, 
                  hintText: "Password",
                  obscureText: true,
                  preffix: Icon(Icons.key)
                ),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: AppButton(
                    title: "Register",
                    onpressed: () async {
                      print("Waiting");
                      setState(() {
                        isLoading = true;
                      });
                      // await Future.delayed(Duration(seconds: 5));
                      DtoCredentials _dto = DtoCredentials(
                        fname: fnameCtrlr.text,
                        mname: mnameCtrlr.text,
                        lname: lnameCtrlr.text,
                        address: addressCtrlr.text,
                        email: emailCtrlr.text,
                        username: usernameCtrlr.text,
                        password: passwordCtrlr.text
                      );
          
                      await apiRegistration.register(_dto).then((value) {
                        print(value.toString());
                      }, onError: (error) {
                        print(error.toString());
                      });
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),

          
          
          isLoading! ? Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black45,
            child: Center(child: SpinKitFadingFour(
              color: Colors.white,
              size: 50.0,
            )),
          ) : SizedBox()
        ],
      ),
    );
  }
}