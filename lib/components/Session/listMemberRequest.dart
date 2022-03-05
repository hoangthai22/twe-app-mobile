import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/Session/memberItem.dart';
import 'package:twe/components/Session/memberRequestItem.dart';
import 'package:twe/models/mentor.dart';

class ListMemberRequest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListMemberRequest();
}

class _ListMemberRequest extends State<ListMemberRequest> {
  List<MentorModel> list = [
    MENTOR_DATA[0],
    MENTOR_DATA[1],
    MENTOR_DATA[2],
    MENTOR_DATA[1],
    MENTOR_DATA[0],
    MENTOR_DATA[0]
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 15, left: 15),
          child: Title(
              color: Colors.black,
              child: Text(
                "Yêu cầu tham gia",
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
            return MemberRequestItem(
                item: member,
                isBorderBottom: index == list.length - 1 ? false : true);
          }).toList()),
        )
      ])
    ]);
  }
}
