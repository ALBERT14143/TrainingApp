import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function onpressed; 
  const AppButton({
    required this.title,
    required this.onpressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: StadiumBorder()
        ),
        onPressed: () {
          onpressed();
        }, 
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(title),
        )
      ),
    );
  }
}