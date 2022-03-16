import 'package:flutter/material.dart';

import '../../common/constants.dart';

class MySessionPageDone extends StatefulWidget {
  const MySessionPageDone({Key? key}) : super(key: key);

  @override
  State<MySessionPageDone> createState() => _MySessionPageCancel();
}

class _MySessionPageCancel extends State<MySessionPageDone> {
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
            Container(
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black12, width: 1.0)),
                ),
                padding: const EdgeInsets.only(bottom: 15, top: 15, left: 15),
                child: Text(
                  "Thành công",
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Roboto',
                  ),
                )),
            Container(
                height: 220,
                decoration: const BoxDecoration(),
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                                    const EdgeInsets.only(top: 50, right: 15),
                                child: CircleAvatar(
                                  radius: 35, // Image radius
                                  backgroundImage: NetworkImage(
                                      "https://firebasestorage.googleapis.com/v0/b/twe-mobile.appspot.com/o/subject%2Flambanner-ky-thuat-thiet-ke-banner-1024x527.png?alt=media&token=35f11e4c-c1cd-49d8-9067-b1a712bc520f"),
                                ))),
                        Expanded(
                            flex: 3,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 50, right: 15),
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
                                      "Giá: 500.000 vnd",
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
                    padding: EdgeInsets.only(top: 150, left: 60),
                    child: FlatButton(
                      child: Text(
                        'Hủy Meetup',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: Color.fromARGB(255, 96, 107, 100),
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 150, left: 40),
                    child: FlatButton(
                      child: Text(
                        'Xem chi tiết',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
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
