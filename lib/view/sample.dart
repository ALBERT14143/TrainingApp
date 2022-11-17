import 'package:flutter/material.dart';

class Sample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text("Sample"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 30,
                child: Container(
                  height: 100,
                  color: Colors.orange,
                ),
              ),

              Expanded(
                flex: 70,
                child: Container(
                  height: 100,
                  color: Colors.green,
                  child: Column(
                    children: [
                      Text("GREEN"),
                      Text("GREEN NAPUD"),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: Container( 
              width: 200,
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }

}