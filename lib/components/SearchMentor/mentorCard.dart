import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/pages/HomeTab/meetup_json.dart';

import '../../pages/HomeTab/help.dart';

class MentorCard extends StatelessWidget {
  final mentor;
  final double width;

  const MentorCard({
    Key? key,
    required this.mentor,
    this.width = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listRate = [for (var i = 1; i <= MENTOR_DATA[0].rate!; i++) i];
    var listRateEmpty = [for (var i = 1; i <= 5 - MENTOR_DATA[0].rate!; i++) i];
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/mentor-detail", arguments: "m1");
          },
          child: Container(
            //padding: EdgeInsets.all(0),
            margin: EdgeInsets.only(bottom: 15),
            width: this.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(top: 0.0)),
                /* Container(
            width: 100,
            height: 150,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(getImageNetwork(mentor["icon"]))),
          ),*/
                Container(
                  width: 250,
                  height: 140,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(getImageNetwork(mentor["image"])),
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mentor["name"] ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Row(children: [
                          if (listRate.length > 0)
                            ...listRate.map((e) {
                              return Icon(
                                Icons.star,
                                size: 18,
                                color: Colors.amber,
                              );
                            }).toList(),
                          if (listRateEmpty.length > 0)
                            ...listRateEmpty.map((e) {
                              return Icon(
                                Icons.star_border,
                                size: 18,
                                color: Colors.amber,
                              );
                            }).toList(),
                          Container(
                            child: Text(
                              " (5.0)",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ]),
                      )),
                    ]),
                Container(
                    height: 35,
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 5, bottom: 15),
                    child: Container(
                      margin: EdgeInsets.only(
                        right: 5,
                        top: 5,
                      ),
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: MaterialColors.primary,
                        border:
                            Border.all(color: MaterialColors.primary, width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        MENTOR_DATA[0].listMajor![0].toString(),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        )
        // Positioned(
        //     right: 0,
        //     top: 10,
        //     child: Container(
        //       alignment: Alignment.center,
        //       height: 30,
        //       width: 60,
        //       decoration: BoxDecoration(
        //           color: Colors.amber[500],
        //           borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(18),
        //             bottomLeft: Radius.circular(18),
        //           )),
        //       child: Icon(Icons.fla)
        //     ))
      ],
    );
  }
}
