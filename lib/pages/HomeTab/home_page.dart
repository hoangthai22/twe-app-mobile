import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/components/Loading/loading.dart';
import 'package:twe/components/SearchMentor/mentor_card.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/pages/HomeTab/padding.dart';
import 'package:twe/components/SearchSession/session_card.dart';
import 'package:twe/pages/HomeTab/session_json.dart';
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
  bool _isLoading = true;
  int test = 0;
  late Future<List<MentorModel>> futureMentor;

  List<MentorModel> parseProducts(String responseBody) {
    final parsed =
        convert.json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<MentorModel>((json) => MentorModel.fromJson(json))
        .toList();
  }

  Future<List<MentorModel>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://theweekendexpertisewebapi.azurewebsites.net/api/v1/mentors?pageIndex=1&pageSize=3'));
    if (response.statusCode == 200) {
      // print("data: ${MentorModel.fromJson(convert.jsonDecode(response.body))}");
      return parseProducts(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // loadData();
    // futureMentor = fetchData();
    // futureMentor.then((vallue) => {print(vallue.toList()[0])});

    super.initState();

    //dang code
  }

  @override
  Widget build(BuildContext context) {
    //print("Home");
    /* return Scaffold(
      backgroundColor: Colors.blue,
      body: _isLoading
          ? Loading()
          : Center(
              child: Text("List session"),
            ),
    */
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
              padding: EdgeInsets.only(left: 15, right: 15),
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
                                width: 60,
                                child: Image.asset(
                                  'assets/logo_transparent.png',
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
              // Container(
              //   padding: EdgeInsets.only(right: 15, left: 30, top: 20),
              //   child: Text(
              //     "Hi Hoàng Thái! ",
              //     style: TextStyle(
              //         fontFamily: "Roboto",
              //         fontSize: 22,
              //         fontWeight: FontWeight.w700),
              //   ),
              // ),
              // Container(
              //   color: MaterialColors.primary,
              //   padding: EdgeInsets.only(right: 15, left: 15),
              //   child: Container(
              //     margin: EdgeInsets.symmetric(vertical: 20),
              //     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(29.5),
              //     ),
              //     child: TextField(
              //       decoration: InputDecoration(
              //         hintText: "Search",
              //         icon: Icon(Icons.search),
              //         border: InputBorder.none,
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 35)),
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
                items: [1, 2, 3, 4].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        child:
                            Image.asset('assets/home1.png', fit: BoxFit.cover),
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
                        /* Container(
            width: 100,
            height: 150,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(getImageNetwork(session["icon"]))),
          ),*/

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
                                            " Buổi học của ngày hôm nay",
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
                            "          Buổi học với Lại Đức Hùng",
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
                                  "          Hôm nay, 10:00 - 11:30 am",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "          Địa điểm, Moda coffee",
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

              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 20),
                        child: Text(
                          "Danh mục buổi học thích hợp với bạn",
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(sessionItems.length, (index) {
                    var session = sessionItems[index];
                    return Padding(
                      //child: SessionCard(session: mentor)
                      padding: const EdgeInsets.only(right: rightMainPadding),
                      child: Container(
                          child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/session', arguments: session["id"]);
                        },
                        child: SessionCard(session: session),
                      )),
                    );
                  }),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(sessionItems.length, (index) {
                    var mentor = mentorItems[index];
                    return Padding(
                      //child: SessionCard(session: mentor)
                      padding: const EdgeInsets.only(right: rightMainPadding),
                      child: Container(child: MentorCard(mentor: mentor)),
                    );
                  }),
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
