import 'package:flutter/material.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/SearchMentor/appbarSearch.dart';
import 'package:twe/components/SearchMentor/filterModal.dart';
import 'package:twe/components/SearchMentor/mentoritem.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/models/subject.dart';

class _SearchPage extends State<SearchPage> {
  late List<MentorModel> mentorList;
  late List<SubjectModel> subList;
  String query = '';

  int checkedInit = 0;

  @override
  void initState() {
    super.initState();
    mentorList = MENTOR_DATA;
    subList = SUBJECT_DATA;
  }

  @override
  void didChangeDependencies() {
    // print("update");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // print("subList int $subList");

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), // Set this height
          child: Container(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBarSearchMentor(
                  text: query,
                  callback: (query) => searchBar(query),
                ),
              ],
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                    width: 100,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                      onPressed: () {
                        _ModalBottom(context);
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
                                side: BorderSide(color: Colors.blue, width: 1),
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
                                      "${subList.where((element) => element.subjectId == checkedInit).toList()[0].subjectName}",
                                      style: TextStyle(color: Colors.blue),
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
                // height: 900,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  // scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: mentorList.length,
                  itemBuilder: (context, index) {
                    return MentorItem(
                      mentor: mentorList[index],
                      onPush: widget.onPush,
                    );
                  },
                ),
              )
              // flex: 14,
              // GridView(
              //   scrollDirection: Axis.vertical,
              //   children: mentorList
              //       .map((item) => MentorItem(
              //             mentor: item,
              //             onPush: widget.onPush,
              //           ))
              //       .toList(),
              //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //       maxCrossAxisExtent: 400,
              //       childAspectRatio: 6 / 3,
              //       crossAxisSpacing: 0,
              //       mainAxisSpacing: 0),
              // ),
            ],
          ),
        ));
  }

  void _ModalBottom(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
        builder: (BuildContext bc) {
          return FilterModal(
              onGetSub: (id) => setState(() {
                    checkedInit = id;
                  }),
              subList: subList,
              checkedInit: checkedInit);
        });
  }

  void clearOption() {}

  void searchBar(String query) {
    final mentors = MENTOR_DATA.where((mentor) {
      final nameLower = mentor.id.toString();
      final searchLower = query.toLowerCase();
      return nameLower == searchLower;
    }).toList();
    setState(() {
      this.query = query;
      mentorList = mentors;
    });
  }
}

class SearchPage extends StatefulWidget {
  late final ValueChanged<int> onPush;

  SearchPage({required this.onPush});

  @override
  _SearchPage createState() => _SearchPage();
}
