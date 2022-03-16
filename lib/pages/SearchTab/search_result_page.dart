import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
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
  }

  final _controller = TextEditingController();
  String inputText = "";

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
        return Center(child: Text("meeting"),);

      default:
        return ListMentorTab(
            isMentorTab: true,
            isFavoriteMentorTab: false,
            isFilterBtn: false,
            searchKey: widget.keySearch);
    }
  }
}
