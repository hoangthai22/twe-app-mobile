import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/Nofication/noficationItem.dart';
import 'package:twe/models/nofication.dart';

class NoficationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NoficationPage();
}

class _NoficationPage extends State<NoficationPage> {
  List<NoficationModel> nofiList = [];
  List<NoficationModel> nofiListToday = [];
  bool loading = false;
  final ScrollController scrollController = ScrollController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    // nofiList = NOFI_DATA;
    fetch();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !loading) {
        // mockData();
      }
    });
  }

  void fetch() async {
    setState(() {
      loading = true;
    });
    List<NoficationModel> listNew = [];
    ApiServices.getListNotification(auth.currentUser!.uid, 1, 20)
        .then((value) => {
              if (value != null)
                {
                  setState(() {
                    listNew = value;
                    listNew
                        .map((e) => {
                              print(e.date),
                              if (e.date.toString() ==
                                  DateTime.now().toString().split(" ")[0])
                                {
                                  nofiListToday.add(e),
                                }
                              else
                                {nofiList.add(e)}
                            })
                        .toList();
                    loading = false;
                  })
                }
            });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Notifi");
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: MaterialColors.primary,
            automaticallyImplyLeading: false,
            leading: BackButton(
              color: Colors.white,
            ),
            title: Text(
              "Thông báo",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
              ),
            )),
        body: ListView(
          controller: scrollController,
          children: [
            if (loading) ...[
              Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
                height: 80,
              )
            ] else if (nofiList.isNotEmpty || nofiListToday.isNotEmpty) ...[
              Container(
                  width: MediaQuery.of(context).size.width * 1,
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 25),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      nofiListToday.isNotEmpty
                          ? Container(
                              child: Text(
                                "Hôm nay",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600),
                              ),
                              margin: EdgeInsets.all(15),
                            )
                          : Container(),
                      if (nofiListToday.isNotEmpty)
                        ...nofiListToday.map((item) {
                          return InkWell(
                            child: NoficationItem(
                              title: item.title.toString(),
                              content: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Roboto",
                                  ),
                                  text: item.content.toString(),
                                  children: [
                                    // TextSpan(
                                    //     text: item.content.toString(),
                                    //     style: TextStyle(
                                    //         fontWeight: FontWeight.w600,
                                    //         color: MaterialColors.primary)),
                                  ]),
                              time: item.time.toString(),
                              image: item.image.toString() == ""
                                  ? "https://firebasestorage.googleapis.com/v0/b/twe-mobile.appspot.com/o/subject%2Fdatabase-change-notification-oracle-63742419191.3747.jpg?alt=media&token=259afcf8-c65c-4f7a-a953-250253c0e97c"
                                  : item.image.toString(),
                              date: "",
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed('/session',
                                  arguments: item.sessionId);
                            },
                          );
                        }).toList()
                    ],
                  )),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(
                  top: 25,
                ),
                padding: EdgeInsets.only(top: 15, bottom: 10, left: 15),
                width: MediaQuery.of(context).size.width * 1,
                child: Text(
                  "Cũ hơn",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 19,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                color: Colors.white,
                child: ListView.separated(
                    // controller: scrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/session',
                              arguments: nofiList[index].sessionId);
                        },
                        child: NoficationItem(
                          content: TextSpan(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Roboto",
                                  fontSize: 14),
                              text: nofiList[index].content,
                              children: [
                                TextSpan(
                                    text: nofiList[index].person,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Roboto",
                                        color: MaterialColors.primary)),
                                // TextSpan(text: " xác nhận"),
                              ]),
                          time: nofiList[index].time.toString(),
                          date: nofiList[index].date.toString(),
                          title: nofiList[index].title.toString(),
                          image: nofiList[index].image.toString() == ""
                              ? "https://firebasestorage.googleapis.com/v0/b/twe-mobile.appspot.com/o/subject%2Fdatabase-change-notification-oracle-63742419191.3747.jpg?alt=media&token=259afcf8-c65c-4f7a-a953-250253c0e97c"
                              : nofiList[index].image.toString(),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(height: 1);
                    },
                    itemCount: nofiList.length),
              ),
            ] else ...[
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  "Không có thông báo nào!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black54,
                      fontFamily: "Roboto",
                      fontSize: 16),
                ),
              )
            ]
          ],
        ));
  }
}
