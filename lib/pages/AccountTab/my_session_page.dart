import 'package:flutter/material.dart';

class MySessionPage extends StatelessWidget {
  const MySessionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: TextButton(child: Text("My session"), onPressed: (){})),
    );
  }
}
