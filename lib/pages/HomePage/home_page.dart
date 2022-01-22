import 'package:flutter/material.dart';
import 'package:twe/components/menuFooter.dart';

class HomePage extends StatelessWidget {
  final onPush;
  const HomePage({Key? key, required this.onPush}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: TextButton(child: Text("Create session"), onPressed: onPush)),
    );
  }
}
