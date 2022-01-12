import 'package:flutter/material.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/Search/appbarSearch.dart';
import 'package:twe/components/menuFooter.dart';
import 'package:twe/components/Search/mentoritem.dart';
import 'package:twe/models/mentor.dart';

class _SearchPage extends State<SearchPage> {
  late List<MentorModel> mentorList;
  String query = '';

  @override
  void initState() {
    super.initState();
    mentorList = MENTOR_DATA;
  }

  @override
  void didChangeDependencies() {
    print("update");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: <Widget>[
          buildSearch(),
          Expanded(
              flex: 14,
              child: GridView(
                padding: EdgeInsets.only(top: 90),
                scrollDirection: Axis.vertical,
                children: mentorList
                    .map((item) => MentorItem(
                          mentor: item,
                          onPush: widget.onPush,
                        ))
                    .toList(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    childAspectRatio: 6 / 3,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
              )),
        ],
      ),
    );
  }

  Widget buildSearch() => CustomAppBar(
        text: query,
        callback: (query) => searchBar(query),
      );

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
