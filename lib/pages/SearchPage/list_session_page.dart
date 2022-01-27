import 'package:flutter/material.dart';
import 'package:twe/provider/appProvider.dart';
import 'package:provider/provider.dart';

class ListSessionPage extends StatelessWidget {
  ListSessionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
          child: ElevatedButton(
        onPressed: () {},
        child: Text("List Session"),
      )),
    ));
  }
}
