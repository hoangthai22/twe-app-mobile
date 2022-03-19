import 'package:flutter/material.dart';
import 'package:twe/common/utils.dart';
import 'package:twe/models/meetup.dart';

import '../../common/constants.dart';

class MyMeetupitem extends StatefulWidget {
  SessionModel sessionModel;
  bool isStatus;
  MyMeetupitem({required this.sessionModel, required this.isStatus, Key? key})
      : super(key: key);

  @override
  State<MyMeetupitem> createState() => _MeetupManagerState();
}

class _MeetupManagerState extends State<MyMeetupitem> {
  bool _value = false;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    print(widget.sessionModel.sessionId);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      // padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () => {
          Navigator.pushNamed(context, "/session",
              arguments: widget.sessionModel.sessionId)
        },
        child: Stack(
          children: [
            if (widget.isStatus) ...[
              Positioned(
                right: 0,
                child: Container(
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, right: 10, left: 10),
                    child: Text(
                      getStatusStringInMyMeetup(widget.sessionModel.status!,
                          widget.sessionModel.isLead!),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                          color: MaterialColors.primary),
                    )),
              ),
            ],
            Container(
                height: 220,
                decoration: const BoxDecoration(),
                margin: const EdgeInsets.only(left: 10, right: 10, top: 0),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Container(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 15),
                                child: CircleAvatar(
                                  radius: 45, // Image radius
                                  backgroundImage:
                                      NetworkImage(widget.sessionModel.image!),
                                ))),
                        Expanded(
                            flex: 3,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 30, right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    widget.sessionModel.subject!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color: MaterialColors.primary,
                                        size: 22,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Text(
                                          widget.sessionModel.date!,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Roboto',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.timer,
                                        color: MaterialColors.primary,
                                        size: 22,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Text(
                                          getSlot(widget.sessionModel.slot!),
                                          maxLines: 2,
                                          style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Roboto',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.school,
                                        color: MaterialColors.primary,
                                        size: 22,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Text(
                                          "Giảng viên " +
                                              widget.sessionModel
                                                  .listMentorInvite![0]["name"],
                                          maxLines: 2,
                                          style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.black87,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Roboto',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: MaterialColors.primary,
                                        size: 22,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Text(
                                          widget.sessionModel.cafeName!,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.black87,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Roboto',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ],
                )),
            Container(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .5 - 20,
                    padding: EdgeInsets.only(top: 160, left: 10),
                    child: FlatButton(
                      height: 40,
                      child: Text(
                        'Hủy bỏ',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500),
                      ),
                      shape: RoundedRectangleBorder(
                        side:
                            BorderSide(color: MaterialColors.primary, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white,
                      textColor: MaterialColors.primary,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (build) {
                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return AlertDialog(
                                  title: Text("Hủy Meetup",
                                      textAlign: TextAlign.center),
                                  content: SingleChildScrollView(
                                    child: Column(children: [
                                      ListTile(
                                        title:
                                            Text("Có việc bận đột xuất!"),
                                        leading: Radio(
                                          value: 1,
                                          groupValue: val,
                                          onChanged: (value) {
                                            setState(() {
                                              val = int.parse(value.toString());
                                            });
                                          },
                                          activeColor: Colors.green,
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Thành viên trong nhóm quá ít!"),
                                        leading: Radio(
                                          value: 2,
                                          groupValue: val,
                                          onChanged: (value) {
                                            setState(() {
                                              val = int.parse(value.toString());
                                            });
                                          },
                                          activeColor: Colors.green,
                                        ),
                                      ),
                                      ListTile(
                                        title: Text("Lý do khác:"),
                                        leading: Radio(
                                          value: 3,
                                          groupValue: val,
                                          onChanged: (value) {
                                            setState(() {
                                              val = int.parse(value.toString());
                                            });
                                          },
                                          activeColor: Colors.green,
                                        ),
                                      ),
                                      if (val == 3) ...[
                                        Container(
                                            height: 100,
                                            child: Card(
                                                color: Colors.white60,
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: TextField(
                                                    maxLines: 8,
                                                    onChanged: (value) {
                                                      setState(() {});
                                                    },
                                                    decoration: InputDecoration
                                                        .collapsed(
                                                            hintStyle: TextStyle(
                                                                fontFamily:
                                                                    "Roboto",
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.4)),
                                                            hintText:
                                                                "Nhập lý do của bạn."),
                                                  ),
                                                )))
                                      ]
                                    ]),
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FlatButton(
                                            height: 40,
                                            color: MaterialColors.primary,
                                            onPressed: () {
                                              Navigator.pop(build);
                                            },
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: MaterialColors.primary,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              "   Xác nhận  ",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: "Roboto",
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        FlatButton(
                                            height: 40,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: MaterialColors.primary,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            color: Colors.white,
                                            onPressed: () {
                                              Navigator.pop(build);
                                            },
                                            child: Text(
                                              "    Hủy bỏ     ",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: "Roboto",
                                                  color: MaterialColors.primary,
                                                  fontWeight: FontWeight.w500),
                                            ))
                                      ],
                                    )
                                  ],
                                );
                              });
                            });
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .5 - 20,
                    padding: EdgeInsets.only(top: 160, left: 10),
                    child: FlatButton(
                      height: 40,
                      child: Text(
                        'Xem chi tiết',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: MaterialColors.primary,
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
