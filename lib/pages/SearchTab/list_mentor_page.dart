import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/CreateSession/listMentorInvite.dart';
import 'package:twe/components/CreateSession/mentoritem.dart';
import 'package:twe/components/SearchCoffee/appbarSearchLocation.dart';
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
  final _controller = TextEditingController();
  String inputText = "";
  bool isSearch = false;

  _fetch() async {
    setState(() {
      _isLoading = true;
    });
    List<MentorModel> mentors = [];
    List<MentorModel> newList = [];
    ApiServices.getListMentorPagination(page, 4).then((item) => {
          if (item != null)
            {
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
                    _isLoading = false;
                    listMentor = newList;
                    page++;
                  })
                }
            }
          else
            {
              setState(() {
                _isLoading = false;
                isListFull = true;
                listMentor = [];
              })
            }
        });
  }

  @override
  void initState() {
    super.initState();
    // listMentor = MENTOR_DATA;
    _fetch();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !_isLoading &&
          !isListFull) {
        // print(query);
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

  Widget _buildSearchField() {
    return TextField(
      autofocus: true,
      controller: _controller,
      decoration: const InputDecoration(
        hintText: 'Tìm một Mentor...',
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

  Widget _buildTitleAppbar() {
    if (widget.isMentorTab) {
      return Text("Chọn một Mentor");
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5, left: 1),
            child: Text(
              "Step 3 of 4",
              style: TextStyle(
                  color: Colors.white70,
                  fontFamily: "Roboto",
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            child: Text(
              "Chọn Mentor yêu thích",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Roboto",
                  fontSize: 19,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: widget.isMentorTab,
            title: isSearch ? _buildSearchField() : _buildTitleAppbar(),
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
                InkWell(
                    onTap: () => showListMentorInvite(),
                    child: Container(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Icon(
                            Icons.person_rounded,
                            color: Colors.white,
                            size: 32,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 5),
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffc32c37),
                                  border: Border.all(
                                      color: MaterialColors.primary, width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Center(child: Consumer<AppProvider>(
                                    builder: (context, provider, child) {
                                  return Text(
                                    provider.getListMentorInvite.length
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  );
                                })),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
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
                      Consumer<AppProvider>(
                          builder: (context, provider, child) {
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
                                            provider
                                                .setListMentorInvite(mentor);
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
                              ],
                              if (listMentor.length == 0 && !_isLoading) ...[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height - 200,
                                  color: Colors.white,
                                  child: Center(
                                    child: Text("Không tìm thấy Mentor nào"),
                                  ),
                                )
                              ]
                            ]);
                      })
                    ],
                  ),
                  (widget.isMentorTab == false && !_isLoading
                      ? Positioned(
                          bottom: 0,
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              child: Text("Xác nhận"),
                              style: ElevatedButton.styleFrom(
                                primary: MaterialColors.primary,
                                textStyle: TextStyle(color: Colors.white),
                                shadowColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
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
              ))),
    );
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

  void searchBar(String query) {
    setState(() {
      _isLoading = true;
      listMentor = [];
    });
    ApiServices.getListMentorBySearchKey(query).then((value) => {
          setState(() {
            this.query = query;
            listMentor = value;
            _isLoading = false;
            // print(listMentor);
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
