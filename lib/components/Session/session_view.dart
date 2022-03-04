import 'package:flutter/material.dart';
import './infoClass.dart';
import './member.dart';

class DetailClass extends StatefulWidget {
  @override
  _DetailClassState createState() => _DetailClassState();
}

class _DetailClassState extends State<DetailClass> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chi tiết khóa học"),
          backgroundColor: Color.fromARGB(255, 20, 109, 72),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Thông tin buổi học",
              ),
              Tab(text: "Thành viên(3/5)")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            InfoClass(),
            Member(),
          ],
        ),
      ),
    );
  }
}
