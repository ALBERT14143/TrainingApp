import 'package:flutter/cupertino.dart';
import 'package:test_app2/provider/bloc/registration_bloc.dart';
import 'package:test_app2/provider/bloc/test_bloc.dart';

class BlocProvider extends InheritedWidget {
  final TestBloc testBloc;
  final RegistrationBloc registrationBloc;

  const BlocProvider({
    required this.testBloc,
    required this.registrationBloc,
    required Widget child,
    Key? key
  }) : super(child: child, key: key);

  static BlocProvider? of(BuildContext context) => 
    context.dependOnInheritedWidgetOfExactType<BlocProvider>();
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

}