import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/pages/MentorTab/list_mentor_tab.dart';
import 'package:twe/pages/SearchTab/list_mentor_page.dart';

class MentorPageMainTab extends StatelessWidget {
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
            text: ("Giảng viên yêu thích"),
          ),
        ],
      );
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Chọn giảng viên yêu thích"),
          backgroundColor: MaterialColors.primary,
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: Colors.white,
              child: _tabBar,
            ),
          ),
        ),
        body: TabBarView(children: [
          ListMentorTab(isMentorTab: true),
          Center(
              child: Text(
            "Giảng viên yêu thích",
            style: TextStyle(fontSize: 50),
          )),
        ]),
      ),
    );
  }
}
