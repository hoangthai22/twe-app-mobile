import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/models/history.dart';

class HistoryItem extends StatelessWidget {
  late HistoryModel history;
  HistoryItem({required this.history});

  convertColorHistory(date) {
    var colorConvert;
    var dateConvert = date / 5;
    switch (dateConvert.toInt()) {
      case 1:
        colorConvert = HistoryColor.blue;
        break;
      case 2:
        colorConvert = HistoryColor.red;
        break;
      case 3:
        colorConvert = HistoryColor.pink;
        break;
      case 4:
        colorConvert = HistoryColor.orange;
        break;
      case 5:
        colorConvert = HistoryColor.green;
        break;
      default:
        colorConvert = HistoryColor.blue;
    }
    return colorConvert;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: EdgeInsets.only(top: 5, bottom: 5),
      width: MediaQuery.of(context).size.width * 1,
      height: 90,
      child: Row(
        children: [
          Container(
              height: 60,
              width: 60,
              // width:  MediaQuery.of(context).size.width * 1,
              // padding: EdgeInsets.only(right: 15, left: 15),
              margin: EdgeInsets.only(right: 10, left: 10),
              decoration: BoxDecoration(
                color: convertColorHistory(int.parse(history.date.substring(0, 2))),
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Center(
                child: Text(
                  history.date.substring(0, history.date.length - 5),
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              )),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.school,
                        size: 20,
                        color: MaterialColors.primary,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1 - 180,
                      child: Text(
                        history.subject.subjectName,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.timer,
                        size: 20,
                        color: MaterialColors.primary,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1 - 180,
                      child: Text(
                        "08:30 - 10:00 AM",
                        maxLines: 1,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.person_rounded,
                        size: 20,
                        color: MaterialColors.primary,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1 - 180,
                      child: Text(
                        history.mentor.mentorName,
                        maxLines: 1,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
