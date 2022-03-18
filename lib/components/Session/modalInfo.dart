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
  ModalInfo({required this.id, required this.isMember});
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
    ApiServices.getProfileByUsername("hoangthai@gmail.com").then((value) => {
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
                Center(
                  child: Text("Thông tin thành viên",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600,
                      )),
                ),
                Container(
                    decoration: BoxDecoration(color: Colors.white),
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 50, // Image radius
                      backgroundImage: NetworkImage(
                          "https://scontent.fsgn5-13.fna.fbcdn.net/v/t1.6435-9/147955006_2884575991815693_2420536097391049087_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=OJ3O1Ydf4i0AX-Q5wH-&_nc_ht=scontent.fsgn5-13.fna&oh=00_AT-bFdF07rgEFkGrDu-wkXoxYzhnO_CE48W1Ar6C8CstQg&oe=624B7B54"),
                    )),
                Container(
                    padding:
                        const EdgeInsets.only(left: 145, top: 20, bottom: 20),
                    child: Text(
                      member.fullname!,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                      ),
                    )),
                Container(
                  child: Row(children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 100, bottom: 20)),
                    Column(children: <Widget>[
                      Icon(Icons.facebook,
                          size: 40, color: Color.fromARGB(255, 28, 134, 238)),
                      Text('Facebook'),
                    ]),
                    Column(children: <Widget>[
                      Text('   '),
                    ]),
                    Column(children: <Widget>[
                      Icon(Icons.mark_chat_unread_sharp,
                          size: 40, color: Color.fromARGB(255, 128, 148, 119)),
                      Text('   Zalo  '),
                    ]),
                    Column(children: <Widget>[
                      Text('   '),
                    ]),
                    Column(children: <Widget>[
                      Icon(Icons.mark_as_unread_sharp,
                          size: 40, color: Color.fromARGB(214, 235, 11, 11)),
                      Text('Email'),
                    ]),
                  ]),
                ),
                Container(
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.black12, width: 1.0)),
                    ),
                    padding: const EdgeInsets.only(bottom: 15, top: 10),
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Text(
                      "Chim đại bàng chọn cô độc để làm chủ bầu trời",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Roboto',
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Chuyên Ngành:",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Niên Khóa:",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Năm sinh:",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Địa chỉ:",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          member.majorName!,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "K14",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          member.birthday!,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            member.address!,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
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
                              onPressed: () {},
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
