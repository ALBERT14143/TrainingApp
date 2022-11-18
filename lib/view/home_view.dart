
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
            Row(
              children: [
                IconButton(
                  onPressed: (){
                    testBloc.setKahoy();
                    // increment();
                  }, 
                  icon: Icon(Icons.add)
                ),

                IconButton(
                  onPressed: (){
                    // decrement();
                  }, 
                  icon: Icon(Icons.remove)
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class HomeView extends StatefulWidget{
//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   int num = 0;

//   void increment() {
//     setState(() {
//       num++;
//     });
//   }

//   void decrement() {
//     setState(() {
//       num--;
//     });
//   }


//   @override
//   Widget build(BuildContext context) {
//     print("state rebuild");
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My App"),
//       ),
//       body: Column(
//         children: [
//           Container(
//             child: Text("You have pushed the button"),
//           ),
//           Text(num.toString()),
//           Row(
//             children: [
//               IconButton(
//                 onPressed: (){
//                   increment();
//                 }, 
//                 icon: Icon(Icons.add)
//               ),

//               IconButton(
//                 onPressed: (){
//                   decrement();
//                 }, 
//                 icon: Icon(Icons.remove)
//               )
//             ],
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             num++;
//           });
//           print(num);
//         }
//       ),
//     );
//   }
// }