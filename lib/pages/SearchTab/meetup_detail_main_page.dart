import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/components/Session/listMemberRequest.dart';
import 'package:twe/models/meetup.dart';
import 'package:twe/pages/SearchTab/meetup_detail_info_page.dart';
import 'package:twe/pages/SearchTab/meetup_detail_member_page.dart';
import 'package:twe/pages/SearchTab/meetup_detail_request_page.dart';
import 'package:twe/provider/appProvider.dart';

class SessionDetailMainPage extends StatefulWidget {
  late String sessionId;

  SessionDetailMainPage({
    required this.sessionId,
  });

  @override
  _SessionDetailMainPageState createState() => _SessionDetailMainPageState();
}

class _SessionDetailMainPageState extends State<SessionDetailMainPage> {
  late SessionModel meeting;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            appBar: AppBar(
              title: Text("Chi tiết Meetup"),
              backgroundColor: MaterialColors.primary,
            ),
            body: Center(
                child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: CircularProgressIndicator(
                      strokeWidth: 3.0,
                      color: MaterialColors.primary,
                    ))))
        : DefaultTabController(
            length: meeting.isLead! ? 3 : 2,
            child: Scaffold(
                appBar: AppBar(
                  title: Text("Chi tiết Meetup"),
                  backgroundColor: MaterialColors.primary,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: ColoredBox(
                      color: Colors.white,
                      child: TabBar(
                        labelColor: MaterialColors.primary,
                        indicatorWeight: 2,
                        labelStyle: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        indicatorColor: Color(0xff107162),
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(
                            text: ("Thông tin"),
                          ),
                          Tab(
                            text: ("Thành viên"),
                          ),
                          if (meeting.isLead!) ...[
                            Tab(
                              text: ("Yêu cầu (4)"),
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
                body: TabBarView(
                  children: [
                    SessionDetailPage(meetingInfo: meeting),
                    SessionMemberPage(
                      members: meeting.listMember!,
                    ),
                    if (meeting.isLead!) ...[
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
    var userId = context.read<AppProvider>().getUid;
    super.initState();
    ApiServices.getMeetingDetailByMeetingId(userId, widget.sessionId)
        .then((value) => {
              if (value != null)
                {
                  setState(() {
                    meeting = value;
                    isLoading = false;
                    print(meeting.isLead);
                  })
                }
            });
  }
}
