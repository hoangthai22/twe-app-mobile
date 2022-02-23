import 'package:flutter/material.dart';

class MySession extends StatelessWidget {
  const MySession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: TextButton(child: Text("My session"), onPressed: (){})),
    );
  }
}
