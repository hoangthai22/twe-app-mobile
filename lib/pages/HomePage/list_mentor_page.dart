import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/CreateSession/listMentorInvite.dart';
import 'package:twe/components/CreateSession/mentoritem.dart';
import 'package:twe/components/SearchCoffee/appbarSearchCoffee.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/provider/appProvider.dart';

class _ListMentorPage extends State<ListMentorPage> {
  bool _isLoading = true;
  bool isListFull = false;
  int page = 1;
  String query = '';
  final ScrollController scrollController = ScrollController();
  int checkedInit = 0;
  late List<MentorModel> listMentor = [];

  _fetch() async {
    setState(() {
      _isLoading = true;
    });
    List<MentorModel> mentors = [];
    List<MentorModel> newList = [];
    ApiServices.getListMentorPagination(page, 4).then((item) => {
          mentors = item,
          if (mentors.isEmpty)
            {
              setState(() {
                isListFull = true;
                _isLoading = false;
              })
            }
          else
            {
              newList = [...listMentor, ...mentors],
              setState(() {
                print("load xong");
                _isLoading = false;
                listMentor = newList;
                page++;
              })
            }
        });
  }

  @override
  void initState() {
    super.initState();
    _fetch();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !_isLoading &&
          !isListFull) {
            print(query);
        _fetch();
      }
    });
    // futureMentor = fetchData();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void showListMentorInvite() {
    return _Modal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), // Set this fromHeight
          child: Container(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            color: MaterialColors.primary,
            child: AppBarSearchCoffee(
              isTabPage: widget.isMentorTab,
              step: "Step 3 of 4",
              hintText: "Tìm một giáo viên",
              title: "Chọn giáo viên",
              text: query,
              callback: (query) => searchBar(query),
              showListMentorInvite: () => showListMentorInvite(),
            ),
          ),
        ),
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Stack(
              children: [
                ListView(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.only(left: 15, top: 10, bottom: 10),
                          width: 100,
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
                            child: Text(
                              "Bộ lọc",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        (checkedInit == 0
                            ? Text("")
                            : Container(
                                padding: EdgeInsets.only(left: 15),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white70,
                                      textStyle: TextStyle(color: Colors.blue),
                                      shadowColor: Colors.white,
                                      side: BorderSide(
                                          color: Colors.blue, width: 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 5),
                                          child: Text(
                                            "",
                                            style:
                                                TextStyle(color: Colors.blue),
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
                    Consumer<AppProvider>(builder: (context, provider, child) {
                      return ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            if (listMentor.length > 0)
                              ...listMentor
                                  .map((MentorModel mentor) => MentorItem(
                                        mentor: mentor,
                                        onPush: (mentorId) {
                                          Navigator.of(context).pushNamed(
                                            '/mentor-detail',
                                            arguments: mentorId,
                                          );
                                        },
                                        isBtnInvite: !widget.isMentorTab,
                                        onSubmit: () {
                                          provider.setListMentorInvite(mentor);
                                        },
                                      ))
                                  .toList(),
                            if (_isLoading) ...[
                              Center(
                                  child: Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3.0,
                                        color: MaterialColors.primary,
                                      )))
                            ]
                          ]);
                    })
                  ],
                ),
                (widget.isMentorTab == false
                    ? Positioned(
                        bottom: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: ElevatedButton(
                            child: Text("Xác nhận"),
                            style: ElevatedButton.styleFrom(
                              primary: MaterialColors.primary,
                              textStyle: TextStyle(color: Colors.white),
                              shadowColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            onPressed: () => {
                              Navigator.of(context).pushNamed(
                                '/confirm-booking',
                              )
                            },
                          ),
                        ))
                    : Container())
              ],
            )));
  }

  void _Modal(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
        builder: (BuildContext bc) {
          return ListMentorInvite();
        });
  }

  void clearOption() {}

  void searchBar(String query) async {
    setState(() {
      _isLoading = true;
      listMentor = [];
    });
    await ApiServices.getListMentorBySearchKey(query).then((value) => {
          print(value),
          setState(() {
            print("object");
            this.query = query;
            listMentor = value;
            _isLoading = false;
          }),
        });
  }
}

class ListMentorPage extends StatefulWidget {
  late final isMentorTab;

  ListMentorPage({required this.isMentorTab});

  @override
  _ListMentorPage createState() => _ListMentorPage();
}
