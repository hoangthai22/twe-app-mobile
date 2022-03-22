import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/apis/apiService.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/models/major.dart';
import 'package:twe/models/user.dart';
import 'package:twe/pages/MentorTab/list_mentor_tab.dart';

class ModalInfo extends StatefulWidget {
  String id;
  bool isMember;
  String meetupId;
  late ValueChanged<void> function;
  ModalInfo(
      {required this.id,
      required this.meetupId,
      required this.isMember,
      required this.function});
  @override
  State<StatefulWidget> createState() => _ModalInfo();
}

class _ModalInfo extends State<ModalInfo> {
  // List<MajorModel> majors = [];
  late UserModel member;
  bool _isLoadingCircle = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
    ApiServices.getProfileByUsername(widget.id).then((value) => {
          if (value != null)
            {
              setState(() {
                member = value;
                print(member);
                _isLoadingCircle = false;
              }),
            }
        });
  }

  hanldeCallback() {
    widget.function("");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.85,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 15, right: 0, top: 15, bottom: 15),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              if (_isLoadingCircle) ...[
                Center(
                    child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: CircularProgressIndicator(
                          strokeWidth: 3.0,
                          color: MaterialColors.primary,
                        )))
              ] else ...[
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text("Thông tin thành viên",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: BoxDecoration(color: Colors.white),
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 50, // Image radius
                      backgroundImage: NetworkImage(member.image!),
                    )),
                Container( alignment: Alignment.center,
                    padding:
                        const EdgeInsets.only(left: 0, top: 20, bottom: 15),
                    child: Text(
                      member.fullname!,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(
                        Icons.school,
                        color: MaterialColors.primary,
                      ),
                      margin: EdgeInsets.only(right: 5),
                    ),
                    Text(
                      member.majorName!,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.grade,
                        color: MaterialColors.primary,
                      ),
                      margin: EdgeInsets.only(right: 5, left: 20),
                    ),
                    Text(
                      "K14",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.date_range,
                        color: MaterialColors.primary,
                      ),
                      margin: EdgeInsets.only(right: 5, left: 20),
                    ),
                    Text(
                      member.birthday ?? "",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding:
                                EdgeInsets.only(left: 0, top: 20, bottom: 20)),
                        Column(children: <Widget>[
                          Icon(Icons.facebook,
                              size: 40,
                              color: Color.fromARGB(255, 28, 134, 238)),
                          Text('Facebook'),
                        ]),
                        Column(children: <Widget>[
                          Text('   '),
                        ]),
                        Column(children: <Widget>[
                          Icon(Icons.mark_chat_unread_sharp,
                              size: 40,
                              color: Color.fromARGB(255, 128, 148, 119)),
                          Text('   Zalo  '),
                        ]),
                        Column(children: <Widget>[
                          Text('   '),
                        ]),
                        Column(children: <Widget>[
                          Icon(Icons.mark_as_unread_sharp,
                              size: 40,
                              color: Color.fromARGB(214, 235, 11, 11)),
                          Text('Email'),
                        ]),
                      ]),
                ),
                Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.black12, width: 1.0)),
                    ),
                    padding: const EdgeInsets.only(bottom: 15, top: 10),
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Chim đại bàng chọn cô độc để làm chủ bầu trời",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Roboto',
                      ),
                    )),
                widget.isMember
                    ? Container(
                        width: MediaQuery.of(context).size.width * .5 - 20,
                        padding: EdgeInsets.only(top: 30, left: 5, right: 20),
                        child: FlatButton(
                          height: 40,
                          child: Text(
                            'Trờ lại',
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
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    : Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .5 - 20,
                            padding: EdgeInsets.only(top: 30, left: 10),
                            child: FlatButton(
                              height: 40,
                              child: Text(
                                "Trở lại",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w500),
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: MaterialColors.primary, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: Colors.white,
                              textColor: MaterialColors.primary,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .5 - 20,
                            padding: EdgeInsets.only(top: 30, left: 10),
                            child: FlatButton(
                              height: 40,
                              child: Text(
                                'Chấp nhận',
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
                              onPressed: () {
                                ApiServices.putAcceptRequestMeetup(
                                        widget.meetupId, widget.id)
                                    .then((result) => {
                                          if (result != null)
                                            {
                                              hanldeCallback(),
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content:
                                                        Text('Đã xác nhận')),
                                              ),
                                              Navigator.pop(context)
                                            }
                                        });
                              },
                            ),
                          ),
                        ],
                      )
              ]
            ],
          ),
        ),
      ],
    );
  }
}
