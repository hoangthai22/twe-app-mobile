import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/CreateSession/listMentorInvite.dart';
import 'package:twe/components/CreateSession/mentoritem.dart';
import 'package:twe/components/SearchCoffee/appbarSearchLocation.dart';
import 'package:twe/components/SearchCoffee/modalFilter.dart';
import 'package:twe/models/major.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/provider/appProvider.dart';
import 'package:twe/routes.dart';

class _ListMentorTab extends State<ListMentorTab>
    with AutomaticKeepAliveClientMixin<ListMentorTab> {
  bool _isLoading = true;
  bool _isLoadingCircle = true;
  bool isListFull = false;
  bool _isChecked = false;
  int page = 1;
  String query = '';
  final ScrollController scrollController = ScrollController();
  String majorId = "";
  late MajorModel majorFilter;
  late List<MentorModel> listMentor = [];
  int _value = 1;

  @override
  bool get wantKeepAlive => true;

  _fetch() async {
    setState(() {
      _isLoadingCircle = true;
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
                    _isLoadingCircle = false;
                    _isLoading = false;
                  })
                }
              else
                {
                  newList = [...listMentor, ...mentors],
                  setState(() {
                    _isLoading = false;
                    _isLoadingCircle = false;
                    listMentor = newList;
                    page++;
                  })
                }
            }
          else
            {
              setState(() {
                _isLoading = false;
                _isLoadingCircle = false;
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
          !_isLoadingCircle &&
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
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
                            (majorId == ""
                                ? Text("")
                                : Container(
                                    height: 40,
                                    padding: EdgeInsets.only(left: 15),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          textStyle: TextStyle(
                                              color: MaterialColors.primary),
                                          shadowColor: Colors.white,
                                          side: BorderSide(
                                              color: MaterialColors.primary,
                                              width: 1),
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
                                                majorFilter.majorName,
                                                style: TextStyle(
                                                    color:
                                                        MaterialColors.primary,
                                                    fontSize: 14,
                                                    fontFamily: "Roboto",
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  majorId = "";
                                                  page = 1;
                                                  listMentor = [];
                                                });
                                                _fetch();
                                              },
                                              child: const Icon(
                                                Icons.highlight_remove_rounded,
                                                color: MaterialColors.primary,
                                                size: 24,
                                              ),
                                            )
                                          ],
                                        )),
                                  )),
                          ],
                        ),
                      ),
                      Skeleton(
                          isLoading: _isLoading,
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
                                            height: 230,
                                            child: SkeletonItem(
                                              child: SkeletonAvatar(
                                                style: SkeletonAvatarStyle(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
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
                          child: Container(
                            margin: EdgeInsets.only(bottom: 0),
                            child: Consumer<AppProvider>(
                                builder: (context, provider, child) {
                              return ListView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  children: [
                                    if (listMentor.length > 0)
                                      ...listMentor
                                          .map((MentorModel mentor) =>
                                              MentorItem(
                                                mentor: mentor,
                                                onPush: (mentorId) {
                                                  Navigator.of(context).pushNamed(
                                                      '/mentor-detail',
                                                      arguments:
                                                          ScreenArgumentsIsTab(
                                                              true, mentorId));
                                                },
                                                isBtnInvite:
                                                    !widget.isMentorTab,
                                                onSubmit: () {
                                                  provider.setListMentorInvite(
                                                      mentor);
                                                },
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
                                    if (listMentor.length == 0 &&
                                        !_isLoadingCircle) ...[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height -
                                                200,
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                              "Không tìm thấy Mentor nào"),
                                        ),
                                      )
                                    ]
                                  ]);
                            }),
                          )),
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
          return ModalFilter(
            onSeletedMajor: (major) => {
              setState(() {
                filterMentorByMajorName(major.majorName);
                majorFilter = major;
                majorId = major.majorId;
              })
            },
          );
        });
  }

  void filterMentorByMajorName(String majorName) {
    setState(() {
      _isLoading = true;
      listMentor = [];
    });
    var checkList = [];
    ApiServices.getListMentorBymajorName(majorName, 1, 10).then((value) => {
          checkList = value,
          if (checkList.isEmpty)
            {
              setState(() {
                isListFull = true;
                listMentor = [];
                _isLoading = false;
              })
            }
          else
            {
              setState(() {
                listMentor = value;
                _isLoading = false;
                // print(listMentor);
              }),
            }
        });
  }

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

class ListMentorTab extends StatefulWidget {
  late final isMentorTab;
  late final isFavoriteMentorTab;

  ListMentorTab({required this.isMentorTab, required this.isFavoriteMentorTab});

  @override
  _ListMentorTab createState() => _ListMentorTab();
}
