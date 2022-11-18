import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_app2/provider/bloc_provider.dart';
import 'package:test_app2/view/home_view.dart';
import 'package:test_app2/view/login_view.dart';

class SplashView extends StatelessWidget {
  static const id = "/";
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final blocAccount = BlocProvider.of(context)!.accountBloc;
    return Scaffold(
      body: FutureBuilder<bool>(
        future: blocAccount.checkUserExist(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!) {
              return HomeView();
            } else {
              return LoginView();
            }
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}