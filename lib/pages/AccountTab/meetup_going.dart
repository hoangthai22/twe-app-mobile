import 'package:flutter/material.dart';

import '../../common/constants.dart';

class MySessionPageGoing extends StatefulWidget {
  const MySessionPageGoing({Key? key}) : super(key: key);

  @override
  State<MySessionPageGoing> createState() => _MySessionPageCancel();
}

class _MySessionPageCancel extends State<MySessionPageGoing> {
  bool _value = false;
  int val = -1;
  @override
  Widget build(BuildContext context) {
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
        //onTap: () => onClick(),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Container(
                  decoration: BoxDecoration(
                    color: MaterialColors.primary,
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
                      top: 12, bottom: 12, right: 17, left: 17),
                  child: Text(
                    "Diễn ra",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                        color: Colors.white),
                  )),
            ),
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
                                  backgroundImage: NetworkImage(
                                      "https://firebasestorage.googleapis.com/v0/b/twe-mobile.appspot.com/o/subject%2Flambanner-ky-thuat-thiet-ke-banner-1024x527.png?alt=media&token=35f11e4c-c1cd-49d8-9067-b1a712bc520f"),
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
                                    "Clean Code",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Lúc: 07:00 - 09:00 (17/03/2022)",
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
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Mentor: Lâm Hữu Khánh Phương",
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
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Tại: Moda Coffee",
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
                                        title: Text("Tôi đang là F0"),
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
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 10, bottom: 5),
                                        width: 270,
                                        child: Text("Lý do khác:"),
                                      ),
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
                                                  decoration:
                                                      InputDecoration.collapsed(
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
