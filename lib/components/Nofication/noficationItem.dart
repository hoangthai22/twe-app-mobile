import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoficationItem extends StatelessWidget {
  final TextSpan content;
  final String title;
  final String time;
  final Color color;

  NoficationItem(
      {required this.color,
      required this.content,
      required this.time,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      padding: EdgeInsets.only(bottom: 15, top: 15),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: 60,
            height: 60,
            child: Icon(
              Icons.notifications_none_outlined,
              color: Colors.white,
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1 - 105,
                  child: Text(
                    title,
                    maxLines: 1,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontFamily: "Roboto",
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    width: MediaQuery.of(context).size.width * 1 - 105,
                    child: RichText(text: content)),
                Text(
                  time,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
