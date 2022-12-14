import 'package:flutter/cupertino.dart';
import 'package:test_app2/provider/bloc/account_bloc.dart';
import 'package:test_app2/provider/bloc/test_bloc.dart';
import 'package:test_app2/provider/bloc/users_bloc.dart';

class BlocProvider extends InheritedWidget {
  final TestBloc testBloc;
  final AccountBloc accountBloc;
  final UsersBloc usersBloc;

  const BlocProvider({
    required this.testBloc,
    required this.accountBloc,
    required this.usersBloc,
    required Widget child,
    Key? key
  }) : super(child: child, key: key);

  static BlocProvider? of(BuildContext context) => 
    context.dependOnInheritedWidgetOfExactType<BlocProvider>();
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

}