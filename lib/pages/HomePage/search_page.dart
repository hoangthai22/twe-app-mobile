import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/CreateSession/appbarSearch.dart';
import 'package:twe/components/CreateSession/filterModal.dart';
import 'package:twe/components/CreateSession/listMentorInvite.dart';
import 'package:twe/components/CreateSession/mentoritem.dart';
import 'package:twe/components/SearchCoffee/appbarSearchCoffee.dart';
import 'package:twe/models/major.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/models/subject.dart';
import 'package:twe/provider/appProvider.dart';

class _SearchPage extends State<SearchPage> {
  late List<MentorModel> mentorList;
  late List<MajorModel> majorList;
  String query = '';

  int checkedInit = 0;

  @override
  void initState() {
    super.initState();
    mentorList = MENTOR_DATA;
    majorList = MAJOR_DATA;
  }

  @override
  void didChangeDependencies() {
    // print("update");
    super.didChangeDependencies();
  }

  void showListMentorInvite() {
    return _Modal(context);
  }

  @override
  Widget build(BuildContext context) {
    // print("majorList int $majorList");

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), // Set this height
          child: Container(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            color: MaterialColors.primary,
            child: AppBarSearchCoffee(
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
              alignment: Alignment.center,
              children: [
                ListView(
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
                                            "${majorList.where((element) => element.majorId == checkedInit).toList()[0].majorName}",
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
                      return Container(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: mentorList.length,
                          itemBuilder: (context, index) {
                            return MentorItem(
                              mentor: mentorList[index],
                              onPush: widget.onPush,
                              onSubmit: () {
                                provider.setListMentorInvite(mentorList[index]);
                              },
                            );
                          },
                        ),
                      );
                    })
                  ],
                ),
                Positioned(
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
                        onPressed: () => widget.onRedirect(),
                      ),
                    ))
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
  late final onRedirect;

  SearchPage({required this.onPush, required this.onRedirect});

  @override
  _SearchPage createState() => _SearchPage();
}
