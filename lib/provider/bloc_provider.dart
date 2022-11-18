import 'package:flutter/cupertino.dart';
import 'package:test_app2/provider/bloc/test_bloc.dart';

class BlocProvider extends InheritedWidget {
  final TestBloc testBloc;

  const BlocProvider({
    required this.testBloc,
    required Widget child,
    Key? key
  }) : super(child: child, key: key);

  static BlocProvider? of(BuildContext context) => 
    context.dependOnInheritedWidgetOfExactType<BlocProvider>();
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

}