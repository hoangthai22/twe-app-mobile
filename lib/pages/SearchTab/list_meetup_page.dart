import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';
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
  bool _isLoadingMeetupRecommend = true;
  bool _isLoadingMeetups = true;
  bool _isLoadingCircle = true;
  bool isListFull = false;
  int page = 1;
  String query = '';
  final ScrollController scrollController = ScrollController();
  final _controller = TextEditingController();
  int checkedInit = 0;
  bool isSearch = false;
  String inputText = "";
  late MajorModel majorFilter;
  List<SessionModel> meetingsRecommend = [];

  late List<SessionModel> listMeetups = [];

  _getListRecommend() async {
    setState(() {
      _isLoadingMeetupRecommend = true;
    });
    ApiServices.getListMeetingRecommendByUserId(
            "12c9cd48-8cb7-4145-8fd9-323e20b329dd", 1, 5)
        .then((item) => {
              if (item != null)
                {
                  setState(() {
                    meetingsRecommend = item;
                    _isLoadingMeetupRecommend = false;
                  })
                }
            });
  }

  _getListAllMeetup() async {
    List<SessionModel> meetings = [];
    List<SessionModel> newList = [];
    setState(() {
      _isLoadingCircle = true;
    });
    ApiServices.getListAllMeetingPaginationByUserId(
            "12c9cd48-8cb7-4145-8fd9-323e20b329dd", page, 3)
        .then((item) => {
              if (item != null)
                {
                  meetings = item,
                  if (meetings.isEmpty)
                    {
                      setState(() {
                        isListFull = true;
                        _isLoadingMeetups = false;
                        _isLoadingCircle = false;
                      })
                    }
                  else
                    {
                      newList = [...listMeetups, ...meetings],
                      setState(() {
                        _isLoadingMeetups = false;
                        _isLoadingCircle = false;
                        listMeetups = newList;
                        page++;
                      })
                    }
                }
              else
                {
                  setState(() {
                    _isLoadingMeetups = false;
                    _isLoadingCircle = false;
                    isListFull = true;
                    listMeetups = [];
                  })
                }
            });
  }

  @override
  void initState() {
    super.initState();
    _getListRecommend();
    _getListAllMeetup();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !_isLoadingCircle &&
          !isListFull) {
        _getListAllMeetup();
      }
    });
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
                                Skeleton(
                                    isLoading: _isLoadingMeetupRecommend,
                                    skeleton: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                            children: [1, 2, 3]
                                                .map(
                                                  (e) => Container(
                                                      margin: EdgeInsets.only(
                                                          top: 15,
                                                          bottom: 15,
                                                          right: 0,
                                                          left: 15),
                                                      width: 170,
                                                      height: 225,
                                                      child: SkeletonItem(
                                                        child: SkeletonAvatar(
                                                          style:
                                                              SkeletonAvatarStyle(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            width:
                                                                double.infinity,
                                                            minHeight: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                8,
                                                            maxHeight: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                3,
                                                          ),
                                                        ),
                                                      )),
                                                )
                                                .toList())),
                                    child: Container(
                                      padding: EdgeInsets.only(right: 15),
                                      height: 255,
                                      child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          children: [
                                            if (meetingsRecommend.isNotEmpty)
                                              ...meetingsRecommend
                                                  .map((SessionModel session) =>
                                                      buildMeetingRecommend(
                                                          session))
                                                  .toList(),
                                          ]),
                                    )),
                              ],
                            )),
                        if (!_isLoadingMeetups) ...[
                          //MySession(session: listMeetups[2]),
                        ],
                        Skeleton(
                            isLoading: _isLoadingMeetups,
                            skeleton: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                    children: [1, 2, 3]
                                        .map(
                                          (e) => Container(
                                              margin: EdgeInsets.only(
                                                  right: 15,
                                                  bottom: 10,
                                                  left: 15),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 245,
                                              child: SkeletonItem(
                                                child: SkeletonAvatar(
                                                  style: SkeletonAvatarStyle(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    width: double.infinity,
                                                    minHeight:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            8,
                                                    maxHeight:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            3,
                                                  ),
                                                ),
                                              )),
                                        )
                                        .toList())),
                            child: Consumer<AppProvider>(
                                builder: (context, provider, child) {
                              return ListView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  children: [
                                    if (listMeetups.length > 0)
                                      ...listMeetups
                                          .map((SessionModel session) =>
                                              SessionItem(
                                                session: session,
                                              ))
                                          .toList(),
                                    if (_isLoadingCircle) ...[
                                      Center(
                                          child: Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: CircularProgressIndicator(
                                                strokeWidth: 3.0,
                                                color: MaterialColors.primary,
                                              )))
                                    ],
                                  ]);
                            })),
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
      _isLoadingMeetupRecommend = true;
      listMeetups = [];
    });
    // ApiServices.getListMentorBySearchKey(query).then((value) => {
    //       setState(() {
    //         this.query = query;
    //         listMentor = value;
    //         _isLoadingMeetupRecommend = false;
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
