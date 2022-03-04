import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/CreateSession/mentoritem.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/provider/appProvider.dart';

class _MyMentorTab extends State<MyMentorTab> {
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.topCenter,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 15, bottom: 15),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 20,
                          runSpacing: 20,
                          children: listMentor
                              .map(
                                (mentor) => Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image(
                                          // color:70olors.red,
                                          width: 180,
                                          height: 200,
                                          fit: BoxFit.cover,
                                          image: NetworkImage(mentor.image!),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin:
                                            EdgeInsets.only(top: 5, left: 5),
                                        child: Text(mentor.fullname!,
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w500,
                                            )),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 5, left: 5),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 170,
                                              margin:
                                                  const EdgeInsets.only(top: 0),
                                              child: Text(
                                                mentor.listMajor![0].toString(),
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.grey[700],
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  width: 180,
                                  height: 260,
                                ),
                              )
                              .toList()),
                    )))));
  }
}

class MyMentorTab extends StatefulWidget {
  @override
  _MyMentorTab createState() => _MyMentorTab();
}
