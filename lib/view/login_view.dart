import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_app2/view/registration_view.dart';

import '../components/app_button.dart';
import '../components/app_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextField(
              controller: usernameController,
              hintText: "Username",
              preffix: Icon(Icons.person),
            ),
            AppTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
              preffix: Icon(Icons.key),
            ),
            SizedBox(
              height: 8,
            ),
            AppButton(
              title: "Login",
              onpressed: (){

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
      ),
    );
  }
}