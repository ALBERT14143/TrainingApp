
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app2/provider/bloc_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    print("State Rebuild");
    final testBloc = BlocProvider.of(context)!.testBloc;
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<String>(
              initialData: "",
              stream: testBloc.streamKahoys,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text("${snapshot.data}", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),);
                } else {
                  return Text("walay data");
                }
              }
            ),

            StreamBuilder<String>(
              initialData: "",
              stream: testBloc.streamLubi,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text("${snapshot.data}", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),);
                } else {
                  return Text("walay data");
                }
              }
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    testBloc.setKahoy();
                  },
                  child: Text("Kuhaon ni Paul ang kahoy."),
                ),

                ElevatedButton(
                  onPressed: (){
                    testBloc.setLubi();
                  },
                  child: Text("Kuhaon ni Renzo ang lubi."),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}