import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';

class SuccessfulPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SuccessfulPage();
}

class _SuccessfulPage extends State<SuccessfulPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          Container(
            child: Image.asset(
              'assets/success.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Icon(
              Icons.check_circle,
              size: 60,
              color: MaterialColors.primary,
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  "Tạo buổi học thành công!",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Roboto"),
                ),
              )),
          Container(
              margin: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Center(
                  child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.3,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                    ),
                    text: "Buổi học của bạn sẽ được diễn ra vào lúc ",
                    children: [
                      TextSpan(
                          text: "2022-02-02, 07:00 - 09:00",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: MaterialColors.primary)),
                      TextSpan(
                          text: ", đợi cho đến khi ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                      TextSpan(
                          text: "TocoToco",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: MaterialColors.primary)),
                      TextSpan(
                          text: " và Mentor ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                      TextSpan(
                          text: "Nguyễn Thế Hoàng",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: MaterialColors.primary)),
                      TextSpan(
                        text: " xác nhận!",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ]),
              ))),
          Container(
            height: 45,
            margin: EdgeInsets.only(left: 120, right: 120, top: 50),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.of(context).pushNamed("/home");
              },
              style: ElevatedButton.styleFrom(
                primary: MaterialColors.primary,
                textStyle: TextStyle(color: Colors.white),
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                "Trang chủ",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
