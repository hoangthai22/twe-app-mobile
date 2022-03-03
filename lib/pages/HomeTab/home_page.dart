import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
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
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            automaticallyImplyLeading: false,
            primary: false,
            excludeHeaderSemantics: true,
            flexibleSpace: SafeArea(
                child: Container(
              padding: EdgeInsets.only(left: 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 0),
                            width: 60,
                            child: Image.asset(
                              'assets/logo_transparent.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            "Toad Study",
                            style: TextStyle(
                                color: Color.fromARGB(255, 14, 105, 17),
                                fontFamily: "Roboto",
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 140),
                            width: 28,
                            child: Image.asset(
                              'assets/chuongvip.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ))),
        body: Container(
          padding: EdgeInsets.only(top: 30, right: 15, left: 15),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 241, 241, 241),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: (Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/home1.png'),
                  ],
                )),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 20),
                        child: Text(
                          "Gợi ý cho bạn!",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30, bottom: 20),
                        child: Text("Xem thêm"),
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
                      child: Container(child: SessionCard(session: session)),
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
                          "Top Mentor của tháng!",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30, bottom: 20),
                        child: Text("Xem thêm"),
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