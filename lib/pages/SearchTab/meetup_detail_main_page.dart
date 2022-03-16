import 'package:flutter/material.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/components/Session/listMemberRequest.dart';
import 'package:twe/models/meetup.dart';
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
              text: ("Yêu cầu"),
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
  late SessionModel meeting;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
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
          body: isLoading
              ? Center(
                  child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: CircularProgressIndicator(
                        strokeWidth: 3.0,
                        color: MaterialColors.primary,
                      )))
              : TabBarView(
                  children: [
                    SessionDetailPage(meetingInfo: meeting),
                    SessionMemberPage(
                      members: meeting.listMember!,
                    ),
                    if (widget.isRequestTab) ...[
                      SessionMemberRequestPage(
                        meetingId: meeting.sessionId!,
                      )
                    ],
                  ],
                )),
    );
  }

  @override
  void initState() {
    super.initState();
    ApiServices.getMeetingDetailByMeetingId(
            "I8WUeMVF3KTDcChKbCwyyUqw6g72", widget.sessionId)
        .then((value) => {
              if (value != null)
                {
                  setState(() {
                    meeting = value;
                    isLoading = false;
                  })
                }
            });
  }
}
