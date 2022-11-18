
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_app2/model/user.dart';
import 'package:test_app2/provider/bloc_provider.dart';
import 'package:test_app2/view/detail_view.dart';

class HomeView extends StatelessWidget {
  static const id = "/home";
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
      body: FutureBuilder<dynamic>(
        future: userBloc.getUsers(),
        builder: (context, fUserSnapshot) {
          if (fUserSnapshot.hasData) {
            var users = fUserSnapshot.data! as List;
            // return Text(users.toString());
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(),
                  title: Text("${users[index]["fname"] ?? ""}"),
                  subtitle: Text("${users[index]["lname"] ?? ""}"),
                  onTap: () {
                    userBloc.setUpdateUser(users[index]);
                    Navigator.pushNamed(context, DetailsView.id);
                  },
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