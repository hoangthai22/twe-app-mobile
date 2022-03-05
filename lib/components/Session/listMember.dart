import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/Session/memberItem.dart';
import 'package:twe/models/mentor.dart';

class ListMember extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListMember();
}

class _ListMember extends State<ListMember> {
  List<MentorModel> list = [MENTOR_DATA[0], MENTOR_DATA[1], MENTOR_DATA[2]];
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 15, left: 15),
            child: Title(
                color: Colors.black,
                child: Text(
                  "Thành viên (3/5)",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                )),
            color: Colors.white,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
                children: list.map((member) {
              var index = list.indexOf(member);
              return MemberItem(
                  item: member,
                  isBorderBottom: index == list.length-1 ? false : true);
            }).toList()),
          )
        ]));
  }
}
