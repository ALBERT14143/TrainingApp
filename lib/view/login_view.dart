import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_app2/provider/bloc_provider.dart';
import 'package:test_app2/view/home_view.dart';
import 'package:test_app2/view/registration_view.dart';

import '../components/app_button.dart';
import '../components/app_textfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    print("REBUILD STATE");
    final blocAccount = BlocProvider.of(context)!.accountBloc;

    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<bool>(
        initialData: false,
        stream: blocAccount.streamLoading,
        builder: (context, snapshot) {
          if (!snapshot.data!) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextField(
                    controller: blocAccount.usernameCtrlr,
                    hintText: "Username",
                    preffix: Icon(Icons.person),
                  ),
                  AppTextField(
                    controller: blocAccount.passwordCtrlr,
                    hintText: "Password",
                    obscureText: true,
                    preffix: Icon(Icons.key),
                  ),
                  AppButton(
                    title: "Login",
                    onpressed: () async{
                      blocAccount.setLoading(true);
                      await blocAccount.login().then((value) {
                        blocAccount.setLoading(false);
                        Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(builder: (context) => HomeView())
                        );
                      }, onError: (error) {
                        blocAccount.setLoading(false);
                        showDialog(
                          context: context, 
                          builder: (context) => Dialog(
                            child: Text(error.toString()),
                          )
                        );
                      });
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  AppButton(
                    title: "Register",
                    onpressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => RegistrationView())
                      );
                    },
                  ),
                  
                ],
              ),
            );
          } else {
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black45,
              child: SpinKitSpinningLines(
                color: Colors.white,
                size: 50.0,
              ),
            );
          }
        }
      ),
    );
  }
}