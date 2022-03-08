import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/components/Session/listMemberRequest.dart';
import 'package:twe/pages/SearchTab/meetup_detail_info_page.dart';
import 'package:twe/pages/SearchTab/meetup_detail_member_page.dart';
import 'package:twe/pages/SearchTab/meetup_detail_request_page.dart';

class SessionDetailMainPage extends StatefulWidget {
  TabBar get _tabBar => TabBar(
        labelColor: MaterialColors.primary,
        indicatorWeight: 2,
        labelStyle: TextStyle(
            fontFamily: "Roboto", fontSize: 16, fontWeight: FontWeight.w500),
        indicatorColor: Color(0xff107162),
        unselectedLabelColor: Colors.black,
        tabs: [
          Tab(
            text: ("Thông tin"),
          ),
          Tab(
            text: ("Thành viên"),
          ),
          if (isRequestTab) ...[
            Tab(
              text: ("Yêu cầu (4)"),
            ),
          ]
        ],
      );

  late String sessionId;
  late bool isRequestTab;
  SessionDetailMainPage({required this.sessionId, required this.isRequestTab});

  @override
  _SessionDetailMainPageState createState() => _SessionDetailMainPageState();
}

class _SessionDetailMainPageState extends State<SessionDetailMainPage> {
  @override
  Widget build(BuildContext context) {
    print("Id: " + widget.sessionId);
    return DefaultTabController(
      length: widget.isRequestTab ? 3 : 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chi tiết Meetup"),
          backgroundColor: MaterialColors.primary,
          bottom: PreferredSize(
            preferredSize: widget._tabBar.preferredSize,
            child: ColoredBox(
              color: Colors.white,
              child: widget._tabBar,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SessionDetailPage(),
            SessionMemberPage(),
            if (widget.isRequestTab) ...[SessionMemberRequestPage()],
          ],
        ),
      ),
    );
  }
}
