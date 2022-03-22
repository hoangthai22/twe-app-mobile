import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/widget_span.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/common/utils.dart';
import 'package:twe/components/CreateSession/mentorItemInvite.dart';
import 'package:twe/components/SearchCoffee/locationItem.dart';
import 'package:twe/models/location.dart';
import 'package:twe/models/meetup.dart';
import 'package:twe/models/mentor.dart';
import 'package:twe/provider/appProvider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SessionDetailPage extends StatefulWidget {
  late SessionModel meetingInfo;

  SessionDetailPage({required this.meetingInfo});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SessionDetailPage();
  }
}

class _SessionDetailPage extends State<SessionDetailPage> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    List<MentorModel> listMentorInvite =
        widget.meetingInfo.listMentorInvite!.map((dynamic item) {
      print(item);
      return MentorModel.fromJson(item);
    }).toList();

    CoffeeModel coffee = CoffeeModel.fromJson(widget.meetingInfo.cafe!);

    return Scaffold(
        body: Container(
      color: Colors.white,
      child: ListView(children: <Widget>[
        Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Chuyên ngành',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.school,
                            size: 22,
                            color: MaterialColors.primary,
                          ),
                          margin: EdgeInsets.only(
                            right: 5,
                          ),
                        ),
                        Title(
                            color: Colors.black,
                            child: Text(
                              widget.meetingInfo.majorName!,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ))),
        Container(
          margin: EdgeInsets.only(left: 40, top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Chủ đề',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.subject,
                      size: 22,
                      color: MaterialColors.primary,
                    ),
                    margin: EdgeInsets.only(
                      right: 5,
                    ),
                  ),
                  Title(
                      color: Colors.black,
                      child: Text(
                        widget.meetingInfo.subject!,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Giá tiền',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.attach_money_outlined,
                            size: 22,
                            color: MaterialColors.primary,
                          ),
                        ),
                        Title(
                            color: Colors.black,
                            child: Text(
                              '${widget.meetingInfo.price} VND / buổi',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Thời gian',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5, bottom: 2),
                              child: Icon(
                                Icons.calendar_month,
                                size: 22,
                                color: MaterialColors.primary,
                              ),
                            ),
                            Title(
                                color: Colors.black,
                                child: Text(
                                  widget.meetingInfo.date!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                )),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20, right: 5, bottom: 2),
                              child: Icon(
                                Icons.schedule,
                                size: 22,
                                color: MaterialColors.primary,
                              ),
                            ),
                            Title(
                                color: Colors.black,
                                child: Text(
                                  getSlot(widget.meetingInfo.slot!) ?? "",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black12, width: 1.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Trạng thái',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5, bottom: 2),
                              child: Icon(
                                Icons.wb_incandescent_outlined,
                                size: 22,
                                color: MaterialColors.primary,
                              ),
                            ),
                            Title(
                                color: Colors.black,
                                child: Text(
                                  getStatusString(widget.meetingInfo.status!),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ))),
        if (status) ...[
          Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Mentor đã mời',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ))),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 20),

            height: 120,
            // width: 120,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: listMentorInvite
                  .map(
                    (mentor) => Container(
                      width: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              // padding: const EdgeInsets.only(right: 15),
                              child: CircleAvatar(
                            radius: 40, // Image radius
                            backgroundImage: NetworkImage(mentor.image!),
                          )),
                          Container(
                            alignment: Alignment.center,
                            // width: 150,
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              //mentor.fullname!,
                              mentor.fullname!,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Roboto"),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
        Container(
          margin: EdgeInsets.only(left: 40, right: 40, bottom: 20),
          decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black12, width: 1.0)),
          ),
        ),
        CoffeeItem(
            coffee: coffee,
            onPush: (e) {},
            isTabPage: false,
            onSubmit: (e) {},
            isStar: true,
            heightImg: 130,
            widthImg: 120,
            isButton: false),
        if (widget.meetingInfo.status == 2 || widget.meetingInfo.status == 3)
          ...[]
        else ...[
          Consumer<AppProvider>(builder: (context, provider, child) {
            return widget.meetingInfo.isLead!
                ? Container(
                    color: Colors.white,
                    height: 50,
                    padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      child: Text(
                        "Hủy meetup",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 17,
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
                      onPressed: () => {dialogCancel()},
                    ),
                  )
                : Container(
                    color: Colors.white,
                    height: 50,
                    padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      child: Text(
                        getStatusStringIsJoin(widget.meetingInfo.isJoin!),
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: widget.meetingInfo.isJoin! == 0
                            ? MaterialColors.primary
                            : MaterialColors.primary.withOpacity(.5),
                        textStyle: TextStyle(color: Colors.white),
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => {
                        if (widget.meetingInfo.isJoin! == 0)
                          {
                            EasyLoading.show(
                              status: 'loading...',
                              maskType: EasyLoadingMaskType.clear,
                            ),
                            ApiServices.postRequestJoinMeetup(
                                    widget.meetingInfo.sessionId!,
                                    provider.getUid)
                                .then((value) => {
                                      EasyLoading.dismiss(),
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Yêu cầu tham gia thành công')),
                                      ),
                                      Navigator.pop(context)
                                    }),
                          }
                      },
                    ),
                  );
          })
        ]
      ]),
    ));
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  int val = -1;
  dialogCancel() {
    return showDialog(
        context: context,
        builder: (build) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text("Hủy Meetup", textAlign: TextAlign.center),
              content: SingleChildScrollView(
                child: Column(children: [
                  ListTile(
                    title: Text("Có việc bận đột xuất!"),
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
                    title: Text("Thành viên trong nhóm quá ít!"),
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
                                decoration: InputDecoration.collapsed(
                                    hintStyle: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 14,
                                        color: Colors.black.withOpacity(0.4)),
                                    hintText: "Nhập lý do của bạn."),
                              ),
                            )))
                  ]
                ]),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                        height: 40,
                        color: MaterialColors.primary,
                        onPressed: () {
                          Navigator.pop(build);
                          EasyLoading.show(
                            status: 'loading...',
                            maskType: EasyLoadingMaskType.clear,
                          );
                          ApiServices.putCancelMeetup(
                                  widget.meetingInfo.sessionId!,
                                  auth.currentUser!.uid)
                              .then((value) => {
                                    if (value != null)
                                      {
                                        EasyLoading.dismiss(),
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'Hủy meetup thành công!')),
                                        ),
                                        Navigator.pop(context)
                                      }
                                  });
                        },
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: MaterialColors.primary, width: 1),
                          borderRadius: BorderRadius.circular(5),
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
                              color: MaterialColors.primary, width: 1),
                          borderRadius: BorderRadius.circular(5),
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
  }
}
