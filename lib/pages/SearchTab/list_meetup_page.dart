import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/common/utils.dart';
import 'package:twe/components/SearchCoffee/modalFilter.dart';
import 'package:twe/components/SearchSession/myMeetup.dart';
import 'package:twe/components/SearchSession/meetupItem.dart';
import 'package:twe/models/major.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/models/meetup.dart';
import 'package:twe/provider/appProvider.dart';

class _ListSessionPage extends State<ListSessionPage> {
  bool _isLoading = true;
  bool isListFull = false;
  int page = 1;
  String query = '';
  final ScrollController scrollController = ScrollController();
  final _controller = TextEditingController();
  int checkedInit = 0;
  bool isSearch = false;
  String inputText = "";
  late MajorModel majorFilter;
  List<SessionModel> meetings = [];

  late List<SessionModel> listSession = [
    SessionModel(
        mentorName: MENTOR_DATA[0].fullname,
        description: MENTOR_DATA[0].description,
        sessionId: "1",
        subject: "Lập trình Java",
        date: "2022-02-20, 09:00 - 10:30",
        slot: 1,
        image: "https://www.koudaiyingwen.com/fe/static/landing_page/chat.webp",
        member: [
          MENTOR_DATA[0].fullname,
          MENTOR_DATA[1].fullname,
        ]),
    SessionModel(
        mentorName: MENTOR_DATA[0].fullname,
        description: MENTOR_DATA[0].description,
        sessionId: "1",
        subject: "Kỹ Thuật Phần Mềm",
        date: "2022-02-20, 09:00 - 10:30",
        slot: 1,
        image:
            "https://thumbs.dreamstime.com/b/teamwork-concept-stack-business-hands-cooperation-teamwork-group-partnership-team-buidding-team-building-concept-stack-109416474.jpg",
        member: [
          MENTOR_DATA[0].fullname,
          MENTOR_DATA[1].fullname,
        ]),
    SessionModel(
        mentorName: MENTOR_DATA[0].fullname,
        description: MENTOR_DATA[0].description,
        sessionId: "2",
        subject: "Kỹ Thuật Phần Mềm",
        date: "2022-02-20, 09:00 - 10:30",
        slot: 1,
        image:
            "https://img.freepik.com/free-vector/candidate-hr-manager-having-job-interview_179970-732.jpg?size=626&ext=jpg",
        member: [
          MENTOR_DATA[0].fullname,
          MENTOR_DATA[1].fullname,
        ]),
    SessionModel(
        mentorName: MENTOR_DATA[0].fullname,
        description: MENTOR_DATA[0].description,
        sessionId: "3",
        subject: "Kỹ Thuật Phần Mềm",
        slot: 1,
        date: "2022-02-20, 09:00 - 10:30",
        image:
            "https://thumbs.dreamstime.com/b/job-interview-hr-manager-office-work-vector-flat-illustration-174794726.jpg",
        member: [
          MENTOR_DATA[0].fullname,
          MENTOR_DATA[1].fullname,
        ]),
  ];

  _fetch() async {
    setState(() {
      _isLoading = true;
    });
    ApiServices.getListMeetingRecommendByUserId(
            "12c9cd48-8cb7-4145-8fd9-323e20b329dd", 1, 5)
        .then((item) => {
              if (item != null)
                {
                  setState(() {
                    meetings = item;
                    _isLoading = false;
                  })
                }
            });
  }

  @override
  void initState() {
    super.initState();
    _fetch();
    // scrollController.addListener(() {
    //   if (scrollController.position.pixels >=
    //           scrollController.position.maxScrollExtent &&
    //       !_isLoading &&
    //       !isListFull) {
    //     print(query);
    //     // _fetch();
    //   }
    // });
    // futureMentor = fetchData();
  }

  void _Modal(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
        builder: (BuildContext bc) {
          return ModalFilter(
            onSeletedMajor: (major) => {
              setState(() {
                filterMentorByMajorName(major.majorName);
                majorFilter = major;
              })
            },
          );
        });
  }

  void filterMentorByMajorName(String majorName) {}
  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  Widget _buildSearchField() {
    return TextField(
      autofocus: true,
      controller: _controller,
      decoration: const InputDecoration(
        hintText: 'Tìm một buổi meetup...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      onSubmitted: (value) {
        searchBar(value);
      },
      onChanged: (text) {
        setState(() {
          inputText = text;
        });
      },
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: isSearch
                ? _buildSearchField()
                : Text("Chọn một buổi meetup"),
            backgroundColor: MaterialColors.primary,
            actions: <Widget>[
              if (isSearch) ...[
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () {
                    // do something
                    setState(() {
                      isSearch = false;
                    });
                  },
                ),
              ] else ...[
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () {
                    // do something
                    setState(() {
                      isSearch = true;
                    });
                  },
                ),
              ]
            ],
          ),
          body: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 50),
                    child: ListView(
                      controller: scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  left: 15, top: 10, bottom: 10),
                              width: 110,
                              height: 40,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: MaterialColors.primary,
                                    textStyle: TextStyle(color: Colors.white),
                                    shadowColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  onPressed: () {
                                    _Modal(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Bộ lọc",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Icon(
                                          Icons.filter_alt_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 15, top: 10, bottom: 10),
                              width: 110,
                              height: 40,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    textStyle: TextStyle(
                                        color: MaterialColors.primary),
                                    shadowColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        side: BorderSide(
                                            color: MaterialColors.primary,
                                            width: 1)),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Sắp xếp",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: MaterialColors.primary,
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Icon(
                                          Icons.sort_by_alpha,
                                          color: MaterialColors.primary,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            (checkedInit == 0
                                ? Text("")
                                : Container(
                                    padding: EdgeInsets.only(left: 15),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white70,
                                          textStyle:
                                              TextStyle(color: Colors.blue),
                                          shadowColor: Colors.white,
                                          side: BorderSide(
                                              color: Colors.blue, width: 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 5),
                                              child: Text(
                                                "",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  checkedInit = 0;
                                                });
                                              },
                                              child: const Icon(
                                                Icons.highlight_remove_rounded,
                                                color: Colors.blue,
                                                size: 24,
                                              ),
                                            )
                                          ],
                                        )),
                                  )),
                          ],
                        ),
                        Container(
                            height: 290,
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(bottom: 15),
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 15, left: 15),
                                  child: Text(
                                    "Bạn có thể thích những nhóm này đấy",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 15),
                                  height: 255,
                                  child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      children: [
                                        if (meetings.isNotEmpty)
                                          ...meetings
                                              .map((SessionModel session) =>
                                                  buildMeetingRecommend(
                                                      session))
                                              .toList(),
                                      ]),
                                )
                              ],
                            )),
                        MySession(session: listSession[2]),
                        Consumer<AppProvider>(
                            builder: (context, provider, child) {
                          return ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                if (listSession.length > 0)
                                  ...listSession
                                      .map(
                                          (SessionModel session) => SessionItem(
                                                session: session,
                                              ))
                                      .toList(),
                                // if (_isLoading) ...[
                                //   Center(
                                //       child: Container(
                                //           margin: EdgeInsets.only(bottom: 10),
                                //           child: CircularProgressIndicator(
                                //             strokeWidth: 3.0,
                                //             color: MaterialColors.primary,
                                //           )))
                                // ],
                                // if (listSession.length == 0 && !_isLoading) ...[
                                //   Container(
                                //     height:
                                //         MediaQuery.of(context).size.height - 200,
                                //     color: Colors.white,
                                //     child: Center(
                                //       child: Text("Không tìm thấy Mentor nào"),
                                //     ),
                                //   )
                                // ]
                              ]);
                        })
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        height: 40,
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 5, right: 5),
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/create-session');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: MaterialColors.primary,
                            textStyle: TextStyle(color: Colors.white),
                            shadowColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            "Tạo một buổi học mới",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ))
                ],
              ))),
    );
  }

  Widget buildMeetingRecommend(session) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade400, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 15, bottom: 15, top: 15),
      width: 170,
      child: _buildSessionItemRecommen(session),
    );
  }

  void searchBar(String query) {
    setState(() {
      _isLoading = true;
      listSession = [];
    });
    // ApiServices.getListMentorBySearchKey(query).then((value) => {
    //       setState(() {
    //         this.query = query;
    //         listMentor = value;
    //         _isLoading = false;
    //         print(listMentor);
    //       }),
    //     });
  }
}

Widget _buildSessionItemRecommen(SessionModel session) {
  return ListView(
    physics: const NeverScrollableScrollPhysics(),
    children: [
      Container(
          margin: EdgeInsets.all(10),
          child: CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(session.image!),
          )),
      Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Center(
            child: Text(
              session.subject!,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500),
            ),
          )),
      Container(
          margin: EdgeInsets.only(top: 5),
          child: Center(
            child: Text(
              "${session.listMemberImage!.length.toString()}/5 thành viên",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400),
            ),
          )),
      Container(
          margin: EdgeInsets.only(top: 5),
          child: Center(
            child: Text(
              getSlot(session.slot!),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400),
            ),
          )),
      Container(
        margin: EdgeInsets.only(left: 17, right: 17, top: 10),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: MaterialColors.primary,
            textStyle: TextStyle(color: Colors.white),
            shadowColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          child: Text(
            "Tham gia",
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500),
          ),
        ),
      )
    ],
  );
}

class ListSessionPage extends StatefulWidget {
  @override
  _ListSessionPage createState() => _ListSessionPage();
}
