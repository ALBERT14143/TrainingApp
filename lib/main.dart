import 'package:flutter/material.dart';
import 'package:test_app2/provider/bloc/account_bloc.dart';
import 'package:test_app2/provider/bloc/test_bloc.dart';
import 'package:test_app2/provider/bloc/users_bloc.dart';
import 'package:test_app2/provider/bloc_provider.dart';
import 'package:test_app2/view/detail_view.dart';
import 'package:test_app2/view/home_view.dart';
import 'package:test_app2/view/registration_view.dart';
import 'package:test_app2/view/sample.dart';
import 'package:test_app2/view/login_view.dart';
import 'package:test_app2/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      usersBloc: UsersBloc(),
      accountBloc: AccountBloc(),
      testBloc: TestBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Roboto"
        ),
        initialRoute: SplashView.id,
        routes: {
          SplashView.id: (context) => SplashView(),
          HomeView.id:(context) => HomeView(),
          LoginView.id:(context) => LoginView(),
          RegistrationView.id: (context) => RegistrationView(),
          DetailsView.id: (context) => DetailsView()
        },
      ),
    );
  }
}