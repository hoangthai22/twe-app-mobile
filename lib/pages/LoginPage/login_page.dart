import 'package:flutter/material.dart';
import 'package:twe/provider/appProvider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
          child: ElevatedButton(
        onPressed: () {
          context.read<AppProvider>().setUserLogin("hoangthai123");
          Navigator.pushNamed(context, '/');
        },
        child: Text("Login"),
      )),
    ));
  }
}
