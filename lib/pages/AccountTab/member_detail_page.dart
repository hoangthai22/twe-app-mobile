import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';

class MemberDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.8,
          brightness: Brightness.light,
          backgroundColor: MaterialColors.primary,
          toolbarHeight: 65,
          automaticallyImplyLeading: false,
          primary: false,
          excludeHeaderSemantics: true,
          flexibleSpace: SafeArea(
              child: Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //margin: EdgeInsets.only(left: 150),
                          child: Row(children: [
                            Text(
                              "Thông tin thành viên",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ))),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              color: Colors.white,
              child: ListView(
                padding: const EdgeInsets.only(
                    right: 15, left: 15, top: 15, bottom: 30),
                children: [
                  Container(
                      decoration: BoxDecoration(color: Colors.white),
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 60, // Image radius
                        backgroundImage: NetworkImage(
                            "https://scontent.fsgn5-13.fna.fbcdn.net/v/t1.6435-9/147955006_2884575991815693_2420536097391049087_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=OJ3O1Ydf4i0AX-Q5wH-&_nc_ht=scontent.fsgn5-13.fna&oh=00_AT-bFdF07rgEFkGrDu-wkXoxYzhnO_CE48W1Ar6C8CstQg&oe=624B7B54"),
                      )),
                  Container(
                      padding:
                          const EdgeInsets.only(left: 145, top: 15, bottom: 10),
                      child: Text(
                        "Võ Chí Công",
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
                            size: 40,
                            color: Color.fromARGB(255, 128, 148, 119)),
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
                      padding:
                          const EdgeInsets.only(left: 35, bottom: 40, top: 10),
                      child: Text(
                        "Chim đại bàng chọn cô độc để làm chủ bầu trời",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                        ),
                      )),
                  Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black12, width: 1.0)),
                      ),
                      padding:
                          const EdgeInsets.only(left: 35, bottom: 10, top: 10),
                      child: Text(
                        "Học tại: FPT University",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                        ),
                      )),
                  Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black12, width: 1.0)),
                      ),
                      padding:
                          const EdgeInsets.only(left: 35, bottom: 10, top: 10),
                      child: Text(
                        "Chuyên Ngành: Kỹ Thuật Phầm Mềm",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                        ),
                      )),
                  Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black12, width: 1.0)),
                      ),
                      padding:
                          const EdgeInsets.only(left: 35, bottom: 10, top: 10),
                      child: Text(
                        "Niên Khóa: K14",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                        ),
                      )),
                  Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black12, width: 1.0)),
                      ),
                      padding:
                          const EdgeInsets.only(left: 35, bottom: 10, top: 10),
                      child: Text(
                        "Đến từ: Quảng Ngãi",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                        ),
                      )),
                  Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black12, width: 1.0)),
                      ),
                      padding:
                          const EdgeInsets.only(left: 35, bottom: 10, top: 10),
                      child: Text(
                        "Từng làm : IT SUPPORT HELP DESK (Member of Hardware and Network FPT Club - Support for Students and Staffs in University)",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                        ),
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
