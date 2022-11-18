
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_app2/model/user.dart';
import 'package:test_app2/provider/bloc_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    print("State Rebuild");
    final testBloc = BlocProvider.of(context)!.testBloc;
    final userBloc = BlocProvider.of(context)!.usersBloc;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: FutureBuilder<List<User>>(
        future: userBloc.getUsers(),
        builder: (context, fUserSnapshot) {
          if (fUserSnapshot.hasData) {
            var users = fUserSnapshot.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index].fName!),
                  subtitle: Text(users[index].email!),
                );
              },
            );
          } else if(fUserSnapshot.hasError) {
            return Text(fUserSnapshot.error.toString());
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
        },
      ),
    );
  }
}