import 'package:flutter/material.dart';
import '../../common/constants.dart';
import './infoClass.dart';
import './member.dart';

class DetailClass extends StatefulWidget {
  TabBar get _tabBar => TabBar(
        labelColor: MaterialColors.primary,
        indicatorWeight: 2,
        labelStyle: TextStyle(
            fontFamily: "Roboto", fontSize: 16, fontWeight: FontWeight.w400),
        indicatorColor: Color(0xff107162),
        unselectedLabelColor: Colors.black,
        tabs: [
          Tab(
            text: ("Đề xuất"),
          ),
          Tab(
            text: ("Mentor yêu thích"),
          ),
        ],
      );
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
