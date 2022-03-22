import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/components/Session/memberItem.dart';
import 'package:twe/models/mentor.dart';

class ListMember extends StatefulWidget {
  List members;
  bool isLeader;
  bool isJoin;
  String meetupId;
  ListMember(
      {required this.members,
      required this.isLeader,
      required this.isJoin,
      required this.meetupId});
  @override
  State<StatefulWidget> createState() => _ListMember();
}

class _ListMember extends State<ListMember> {
  // List<MentorModel> list = [MENTOR_DATA[0], MENTOR_DATA[1], MENTOR_DATA[2]];
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(top: 15),
            child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 15, left: 15),
                child: Title(
                    color: Colors.black,
                    child: Text(
                      "Thành viên (${widget.members.length}/5)",
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
                    children: widget.members.map((dynamic item) {
                  var index = widget.members.indexOf(item);
                  return MemberItem(
                      id: item["id"],
                      majorName: item["majorName"],
                      memberName: item["name"],
                      image: item["image"],
                      isBorderBottom:
                          index == widget.members.length - 1 ? false : true);
                }).toList()),
              )
            ])),
        if (widget.isJoin && !widget.isLeader) ...[
          Positioned(
            bottom: 0,
            child: Container(
              height: 50,
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: ElevatedButton(
                child: Text(
                  "Rời khỏi meetup",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                  primary: MaterialColors.primary,
                  textStyle: TextStyle(color: Colors.white),
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  EasyLoading.show(
                    status: 'loading...',
                    maskType: EasyLoadingMaskType.clear,
                  );
                  ApiServices.postLeaveMeetup(
                          widget.meetupId, auth.currentUser!.uid)
                      .then((value) => {
                            if (value != null)
                              {
                                EasyLoading.dismiss(),
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Đã rời khỏi meetup')),
                                ),
                                Navigator.pop(context)
                              }
                          });
                },
              ),
            ),
          )
        ]
      ],
    );
  }
}
