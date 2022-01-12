import 'package:flutter/material.dart';
import 'package:twe/components/menuFooter.dart';

class _ListCoffeePage extends State<ListCoffeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${widget.mentorId} List',
          ),
        ),
        body: Center(
          child: InkWell(
            child: Text("Coffe"),
          ),
        ));
  }
}

class ListCoffeePage extends StatefulWidget {
  final int mentorId;
  ListCoffeePage({required this.mentorId});
  @override
  _ListCoffeePage createState() => _ListCoffeePage();
}
