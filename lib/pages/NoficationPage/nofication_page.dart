import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/components/Nofication/noficationItem.dart';
import 'package:twe/provider/appProvider.dart';
import 'package:provider/provider.dart';

class NoficationPage extends StatelessWidget {
  NoficationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: MaterialColors.primary,
            automaticallyImplyLeading: false,
            title: const Center(
              child: Text(
                "Thông báo",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Roboto",
                ),
              ),
            )),
        body: Container(
            width: MediaQuery.of(context).size.width * 1,
            color: Colors.white,
            margin: EdgeInsets.only(top: 25, bottom: 25),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  child: Text(
                    "Hôm nay",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
                  ),
                  margin: EdgeInsets.all(15),
                ),
                NoficationItem(
                  title: "Buổi học đã được xác nhận",
                  content: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Roboto",
                      ),
                      text: "Buổi học của bạn đã được giảng viên ",
                      children: [
                        TextSpan(
                            text: "Phạm Văn Dương",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: MaterialColors.primary)),
                        TextSpan(text: " xác nhận"),
                      ]),
                  time: "19:03",
                  color: Colors.blueAccent.withOpacity(0.7),
                ),
                NoficationItem(
                  title: "Buổi học đã được xác nhận",
                  content: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Roboto",
                      ),
                      text: "Buổi học của bạn đã được giảng viên ",
                      children: [
                        TextSpan(
                            text: "Phạm Văn Dương",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: MaterialColors.primary)),
                        TextSpan(text: " xác nhận"),
                      ]),
                  time: "19:03",
                  color: Colors.redAccent.withOpacity(0.7),
                ),
              ],
            )));
  }
}
