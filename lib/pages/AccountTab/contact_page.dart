import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../common/constants.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: MaterialColors.primary,
            automaticallyImplyLeading: false,
            leading: BackButton(
              color: Colors.white,
            ),
            title: Text(
              "Liên hệ với chúng tôi",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
              ),
            )),
        body: Container(
            padding: EdgeInsets.only(top: 30, right: 20, left: 15),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 241, 241, 241),
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    child: Column(children: [
                      Container(
                        child: Image.asset('assets/logo_transparent.png'),
                      ),
                      Text(
                        "Cóc Lên !",
                        style: TextStyle(
                            color: Color.fromARGB(255, 14, 105, 17),
                            fontFamily: "Roboto",
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                    ]),
                  ),
                  Container(
                    child: Row(children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 130)),
                      Column(children: <Widget>[
                        Icon(Icons.facebook,
                            size: 60, color: Color.fromARGB(255, 28, 134, 238)),
                        Text('Fanpage'),
                      ]),
                      Column(children: <Widget>[
                        Icon(Icons.web,
                            size: 60, color: Color.fromARGB(255, 59, 61, 58)),
                        Text('Website'),
                      ]),
                    ]),
                  ),
                  Container(
                    child: Row(children: [
                      Padding(padding: EdgeInsets.only(top: 35)),
                      Text(
                        "Email: CocLen@gmail.com",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Roboto",
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ),
                  Container(
                    child: Row(children: [
                      Padding(padding: EdgeInsets.only(top: 30)),
                      Text(
                        "Hotline: 0123456789",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Roboto",
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ),
                  Container(
                    child: Row(children: [
                      Padding(padding: EdgeInsets.only(top: 30)),
                      Text(
                        "Tổ chức: Sinh viên đại học FPT",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Roboto",
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ),
                  Container(
                    child: Row(children: [
                      Padding(padding: EdgeInsets.only(top: 30)),
                      Text(
                        "Địa chỉ: Đường D2, khu CNC, quận 9, TP HCM",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Roboto",
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ),
                  Container(
                    child: Column(children: [
                      Padding(padding: EdgeInsets.only(top: 30)),
                      Text(
                        "Đánh giá",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Roboto",
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      )
                    ]),
                  ),
                  Container(
                    child: Row(children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 45)),
                      Icon(Icons.star,
                          size: 60, color: Color.fromARGB(255, 236, 214, 9)),
                      Icon(Icons.star,
                          size: 60, color: Color.fromARGB(255, 236, 214, 9)),
                      Icon(Icons.star,
                          size: 60, color: Color.fromARGB(255, 236, 214, 9)),
                      Icon(Icons.star,
                          size: 60, color: Color.fromARGB(255, 236, 214, 9)),
                      Icon(Icons.star,
                          size: 60, color: Color.fromARGB(255, 236, 214, 9)),
                    ]),
                  )
                ])));
  }
}
