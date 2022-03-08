import 'package:flutter/material.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/components/SearchMentor/feedback_tab.dart';
import 'package:twe/components/SearchMentor/infoTab.dart';
import 'package:twe/components/SearchMentor/MeetupMentorTab.dart';
import 'package:twe/models/feedback.dart';
import 'package:twe/models/mentor.dart';

class CustomTabMentor extends StatefulWidget {
  MentorModel mentor;
  CustomTabMentor({required this.mentor});

  TabBar get _tabBar => TabBar(
        labelColor: MaterialColors.primary,
        // indicatorWeight: 2,
        labelStyle: TextStyle(
            fontFamily: "Roboto", fontSize: 16, fontWeight: FontWeight.w600),
        indicatorColor: Color(0xff107162),
        unselectedLabelColor: Colors.black54,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
        tabs: [
          Tab(
            text: ("Thông tin"),
          ),
          Tab(
            text: ("Lịch biểu"),
          ),
          Tab(
            text: ("Đánh giá"),
          ),
        ],
      );
  @override
  State<StatefulWidget> createState() => _CustomTabMentor();
}

class _CustomTabMentor extends State<CustomTabMentor> {
  List<FeedbackModel> listFeedback = [];

  @override
  void initState() {
    super.initState();
    ApiServices.getListFeebackByMentorId(widget.mentor.id!, 1, 3)
        .then((value) => {
              setState(() {
                listFeedback = value;
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: new PreferredSize(
          preferredSize: widget._tabBar.preferredSize,
          child: ColoredBox(
            color: Colors.white,
            child: widget._tabBar,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            InfoTab(
              mentor: widget.mentor,
            ),
            SessionMentorTab(),
            FeedbackTab(
                listFeedback: listFeedback, rate: widget.mentor.rate! + .0),
          ],
        ),
      ),
    );
  }
}
