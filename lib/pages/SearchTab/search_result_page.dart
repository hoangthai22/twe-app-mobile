import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/components/SearchSession/meetupItem.dart';
import 'package:twe/models/meetup.dart';
import 'package:twe/pages/MentorTab/list_mentor_tab.dart';

import 'list_location_page.dart';

class SearchResultPage extends StatefulWidget {
  String keySearch;
  String type;

  SearchResultPage({required this.keySearch, required this.type});
  @override
  State<StatefulWidget> createState() => _SearchResultPage();
}

class _SearchResultPage extends State<SearchResultPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _controller.text = widget.keySearch;
    });
    if (widget.type == "meeting") {
      ApiServices.getListMentorBySearchKey(widget.keySearch).then((value) => {
        print(value),
            if (value != null)
              {
                setState(() {
                  listMeetups = value;
                }),
              }
          });
    }
  }

  final _controller = TextEditingController();
  String inputText = "";
  late List<SessionModel> listMeetups = [];

  Widget _buildSearchField() {
    return TextField(
      autofocus: false,
      controller: _controller,
      decoration: const InputDecoration(
        hintText: 'Tìm một Mentor...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      onSubmitted: (value) {},
      onChanged: (text) {},
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: _buildSearchField(),
          backgroundColor: MaterialColors.primary,
        ),
        body: bodyBuild());
  }

  Widget bodyBuild() {
    switch (widget.type) {
      case "mentor":
        return ListMentorTab(
            isMentorTab: true,
            isFavoriteMentorTab: false,
            isFilterBtn: false,
            searchKey: widget.keySearch);
      case "meeting":
        return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              if (listMeetups.length > 0)
                ...listMeetups
                    .map((SessionModel session) => SessionItem(
                          session: session,
                        ))
                    .toList()
              else ...[
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height - 80,
                  child: Center(
                      child: Text(
                    "Không tìm thấy metetup nào!",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400),
                  )),
                )
              ],
            ]);

      default:
        return ListMentorTab(
            isMentorTab: true,
            isFavoriteMentorTab: false,
            isFilterBtn: false,
            searchKey: widget.keySearch);
    }
  }
}
