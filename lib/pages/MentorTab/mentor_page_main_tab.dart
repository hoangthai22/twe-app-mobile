import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/pages/MentorTab/list_mentor_tab.dart';
import 'package:twe/pages/MentorTab/my_mentor_tab.dart';
import 'package:twe/pages/SearchTab/list_mentor_page.dart';

class MentorPageMainTab extends StatefulWidget {
  TabBar get _tabBar => TabBar(
        labelColor: MaterialColors.primary,
        indicatorWeight: 2,
        labelStyle: TextStyle(
            fontFamily: "Roboto", fontSize: 16, fontWeight: FontWeight.w600),
        indicatorColor: Color(0xff107162),
        unselectedLabelColor: Colors.black54,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
        tabs: [
          Tab(
            text: ("Đề xuất"),
          ),
          Tab(
            text: ("Mentor yêu thích"),
          ),
        ],
      );

  @override
  State<StatefulWidget> createState() => _MentorPageMainTab();
}

class _MentorPageMainTab extends State<MentorPageMainTab> {
  final _controller = TextEditingController();
  String inputText = "";
  bool isSearch = false;

  Widget _buildSearchField() {
    return TextField(
      autofocus: true,
      controller: _controller,
      decoration: const InputDecoration(
        hintText: 'Tìm một Mentor...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      onSubmitted: (value) {},
      onChanged: (text) {
        setState(() {
          inputText = text;
        });
      },
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
    );
  }

  Widget _buildTitleAppbar() {
    return Text("Chọn một Mentor của bạn");
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: isSearch ? _buildSearchField() : _buildTitleAppbar(),
          backgroundColor: MaterialColors.primary,
          bottom: PreferredSize(
            preferredSize: widget._tabBar.preferredSize,
            child: ColoredBox(
              color: Colors.white,
              child: widget._tabBar,
            ),
          ),
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
        body: TabBarView(children: [
          ListMentorTab(
            isMentorTab: true,
            isFavoriteMentorTab: false,
          ),
          ListMentorTab(isMentorTab: true, isFavoriteMentorTab: true),
        ]),
      ),
    );
  }
}
