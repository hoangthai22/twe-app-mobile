import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/components/SearchMentor/mentorCard.dart';
import 'package:twe/models/meetup.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/pages/HomeTab/padding.dart';
import 'package:twe/components/SearchSession/meetup_card.dart';
import 'package:twe/pages/HomeTab/meetup_json.dart';
import 'package:twe/provider/appProvider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:carousel_slider/carousel_slider.dart';

const riveFile = 'assets/loading.riv';
const home1 = 'assets/home1.png';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool _isLoadingMeetup = true;
  bool _isLoadingMentorTopRank = true;
  int test = 0;
  List<SessionModel> meetings = [];
  List<MentorModel> mentorsTopRank = [];
  List<String> vouchers = [];
  @override
  void initState() {
    super.initState();
    _fetch();
    _getMentorTOpRank();
    getListVoucher();
  }

  getListVoucher() {
    ApiServices.getListVoucherHome().then((value) => {
          setState(() {
            vouchers = value;
          })
        });
  }

  _fetch() async {
    setState(() {
      _isLoadingMeetup = true;
    });
    ApiServices.getListMeetingRecommendByUserId(
            "38e24a19-db44-44e8-bf5b-eb2e595906db", 1, 3)
        .then((item) => {
              if (item != null)
                {
                  setState(() {
                    meetings = item;
                    _isLoadingMeetup = false;
                  })
                }
            });
  }

  _getMentorTOpRank() async {
    setState(() {
      _isLoadingMentorTopRank = true;
    });
    ApiServices.getListMentorTopRank(1, 3).then((item) => {
          if (item != null)
            {
              setState(() {
                mentorsTopRank = item;
                _isLoadingMentorTopRank = false;
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.8,
            brightness: Brightness.light,
            backgroundColor: MaterialColors.primary,
            toolbarHeight: 65,
            automaticallyImplyLeading: false,
            primary: false,
            excludeHeaderSemantics: true,
            flexibleSpace: SafeArea(
                child: Container(
              padding: EdgeInsets.only(left: 0, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 0),
                            child: Row(children: [
                              Container(
                                width: 85,
                                height: 65,
                                child: Image.asset(
                                  'assets/coctrensach5.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "Toad ",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Learn",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ]),
                          ),
                          Container(
                              // margin: EdgeInsets.only(left: 0),
                              margin: EdgeInsets.only(top: 0),
                              width: 28,
                              child: Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size: 32,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ))),
        body: Container(
          padding: EdgeInsets.only(top: 10, right: 15, left: 15),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 241, 241, 241),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Stack(
                children: [
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 231, 218, 218),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 0.0)),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      margin: const EdgeInsets.only(left: 5),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.assignment_turned_in_rounded,
                                            color:
                                                Color.fromARGB(255, 7, 23, 172),
                                            size: 25,
                                          ),
                                          Text(
                                            " Buổi meetup của ngày hôm nay",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 7, 23, 172),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: Text(
                            "          Meetup với Lại Đức Hùng",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "          Lúc 10:00 - 11:30 am, tại Moda coffee, Nguyễn Oanh",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 40)),
                    Text(
                      "Tuần nay có gì mới!",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 220.0,
                  autoPlay: true,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                ),
                items: vouchers.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(item),
                      ));
                    },
                  );
                }).toList(),
              ),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(bottom: 30)),
                      Text(
                        "Hot giảm giá cùng bạn bè đến ngay!",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ],
              ),
              Stack(
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Nhập mã FPTSTUDENT để được giảm ngay 10%",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ],
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 220.0,
                  autoPlay: true,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                ),
                items: [1, 2, 3, 4].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        child: Image.asset('assets/11.jpg', fit: BoxFit.cover),
                      );
                    },
                  );
                }).toList(),
              ),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(bottom: 30)),
                      Text(
                        "Bạn không muốn rớt môn!",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ],
              ),
              Stack(
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Ôn tập ngay hôm nay",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ],
              ),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 20),
                        child: Text(
                          "Meetup thích hợp",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/suggest-session");
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 0, bottom: 20),
                          child: Text(
                            "Xem thêm",
                            style: TextStyle(
                                fontSize: 14,
                                color: MaterialColors.primary,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Skeleton(
                isLoading: _isLoadingMeetup,
                skeleton: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                            width: 250,
                            height: 314,
                            child: SkeletonItem(
                              child: SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                                  borderRadius: BorderRadius.circular(10),
                                  width: double.infinity,
                                  minHeight:
                                      MediaQuery.of(context).size.height / 8,
                                  maxHeight:
                                      MediaQuery.of(context).size.height / 3,
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 10,
                          width: 20,
                        ),
                        Container(
                            width: 250,
                            height: 314,
                            child: SkeletonItem(
                              child: SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                                  width: double.infinity,
                                  minHeight:
                                      MediaQuery.of(context).size.height / 8,
                                  maxHeight:
                                      MediaQuery.of(context).size.height / 3,
                                ),
                              ),
                            )),
                      ],
                    )),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    if (meetings.isNotEmpty)
                      ...meetings
                          .map((item) => Padding(
                                //child: SessionCard(session: mentor)
                                padding: const EdgeInsets.only(
                                    right: rightMainPadding),
                                child: Container(
                                    child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/session',
                                        arguments: item.sessionId);
                                  },
                                  child: SessionCard(session: item),
                                )),
                              ))
                          .toList()
                  ]),
                ),
              ),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 20),
                        child: Text(
                          "Mentor nổi bật",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/ranking");
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 30, bottom: 20),
                          child: Text(
                            "Xem thêm",
                            style: TextStyle(
                                fontSize: 14,
                                color: MaterialColors.primary,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Skeleton(
                isLoading: _isLoadingMentorTopRank,
                skeleton: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: [1, 2, 3]
                            .map(
                              (e) => Container(
                                  margin:
                                      EdgeInsets.only(right: 20, bottom: 15),
                                  width: 200,
                                  height: 250,
                                  child: SkeletonItem(
                                    child: SkeletonAvatar(
                                      style: SkeletonAvatarStyle(
                                        borderRadius: BorderRadius.circular(10),
                                        width: double.infinity,
                                        minHeight:
                                            MediaQuery.of(context).size.height /
                                                8,
                                        maxHeight:
                                            MediaQuery.of(context).size.height /
                                                3,
                                      ),
                                    ),
                                  )),
                            )
                            .toList())),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: mentorsTopRank
                          .map((item) => Padding(
                                //child: SessionCard(session: mentor)
                                padding: const EdgeInsets.only(
                                    right: rightMainPadding),
                                child:
                                    Container(child: MentorCard(mentor: item)),
                              ))
                          .toList()),
                ),
              ),
            ],
          ),
        ));
  }
}
/*
Stack(
                children: [
                  Row(
                    children: List.generate(3, (index) {
                      var session = sessionItems[index];
                      return Container(child: SessionCard(session: session));
                    }),
                  )
                ],
              ),*/
