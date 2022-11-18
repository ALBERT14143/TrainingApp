import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_app2/components/app_textfield.dart';
import 'package:test_app2/model/dto_credentials.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_app2/provider/bloc_provider.dart';

import '../components/app_button.dart';

class RegistrationView extends StatelessWidget {
  static const id = "/registration";
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    final regBloc = BlocProvider.of(context)!.accountBloc;

    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppTextField(
              controller: regBloc.fnameCtrlr, 
              hintText: "First name", 
              preffix: Icon(Icons.person)
            ),
            AppTextField(
              controller: regBloc.mnameCtrlr, 
              hintText: "Middle name", 
              preffix: Icon(Icons.person)
            ),
            AppTextField(
              controller: regBloc.lnameCtrlr, 
              hintText: "Last name", 
              preffix: Icon(Icons.person)
            ),
            AppTextField(
              controller: regBloc.addressCtrlr, 
              hintText: "Address", 
              preffix: Icon(Icons.pin_drop_outlined)
            ),
            AppTextField(
              controller: regBloc.emailCtrlr, 
              hintText: "Email", 
              preffix: Icon(Icons.alternate_email_outlined)
            ),
            AppTextField(
              controller: regBloc.usernameCtrlr, 
              hintText: "Username", 
              preffix: Icon(Icons.person)
            ),
            AppTextField(
              controller: regBloc.passwordCtrlr, 
              hintText: "Password",
              obscureText: true,
              preffix: Icon(Icons.key)
            ),
      
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: AppButton(
                title: "Register",
                onpressed: () async {

                  showDialog(
                    context: context, 
                    builder: (context) => Dialog(
                      child: FutureBuilder<String>(
                        future: regBloc.register(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text("OK");
                          } else if(snapshot.hasError) {
                            return Text("${snapshot.error}");
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                          //http://172.16.26.60/flutter-training/api/Account/Login
                        }
                      ),
                    )
                  );
                  // Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}