import 'package:flutter/material.dart';
import 'package:twe/components/menuFooter.dart';

class ListSessionPage extends StatelessWidget {
  const ListSessionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Create session");
    return Container(
      child: Center(
          child: TextButton(child: Text("Create session"), onPressed: () {
             Navigator.pushNamed(context, '/create-session');
          })),
    );
  }
}
