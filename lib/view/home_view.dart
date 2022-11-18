


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_app2/components/app_button.dart';
import 'package:test_app2/model/user.dart';
import 'package:test_app2/provider/bloc_provider.dart';
import 'package:test_app2/view/detail_view.dart';
import 'package:test_app2/view/splash_view.dart';

class HomeView extends StatelessWidget {
  static const id = "/home";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    print("State Rebuild");
    final testBloc = BlocProvider.of(context)!.testBloc;
    final userBloc = BlocProvider.of(context)!.usersBloc;
    final accountBloc = BlocProvider.of(context)!.accountBloc;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        actions: [
          IconButton(
            onPressed: () async {
              showDialog(
                context: context, 
                builder: (context) {
                  return Dialog(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Gusto ba nimo ipagawas imong account?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24
                            ),
                          ),
                          SizedBox(height: 32),
                          Row(
                            children: [
                              Expanded(
                                child: AppButton(
                                  title: "Ayaw lang", 
                                  onpressed: (){
                                    Navigator.pop(context);
                                  }
                                ),
                              ),

                              SizedBox(width: 8),

                              Expanded(
                                child: AppButton(
                                  title: "Oo", 
                                  onpressed: () async {
                                    await accountBloc.removeAccount();
                                    Navigator.pushReplacementNamed(context, SplashView.id);
                                  }
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
              );
            }, 
            icon: Icon(Icons.logout)
          )
        ],
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