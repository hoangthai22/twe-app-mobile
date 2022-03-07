import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/models/session.dart';

class MySession extends StatelessWidget {
  late SessionModel session;
  MySession({required this.session});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 295,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 15, left: 15, right: 15),
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15, bottom: 5),
                  child: Text(
                    "Buổi học của bạn hiện tại",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.only(right: 15),
                //   height: 255,
                //   child: ListView(
                //       scrollDirection: Axis.horizontal,
                //       shrinkWrap: true,
                //       children: []),
                // ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Image(
                    // color:70olors.red,
                    height: 150,
                    fit: BoxFit.cover,
                    image: NetworkImage(session.image!),
                  ),
                ),
                Container(
                    // color: Colors.amber,
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                session.subject!,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Roboto",
                                    fontSize: 17),
                              ),
                              margin: EdgeInsets.only(bottom: 5),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 2),
                                  child: Icon(Icons.calendar_month_outlined,
                                      size: 18, color: Colors.green[700]),
                                ),
                                Text(
                                  session.date!
                                          .split(",")[0]
                                          .split("-")[1]
                                          .toString() +
                                      "-" +
                                      session.date!
                                          .split(",")[0]
                                          .split("-")[2]
                                          .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Roboto",
                                      color: Colors.green[700],
                                      fontSize: 14),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Icon(Icons.schedule,
                                      size: 18, color: Colors.green[700]),
                                ),
                                Text(
                                  session.date!.split(",")[1],
                                  style: TextStyle(
                                      color: Colors.green[700],
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Roboto",
                                      fontSize: 14),
                                ),
                              ],
                            )
                          ],
                        )),
                        Container(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: CircleAvatar(
                                radius: 17,
                                backgroundImage:
                                    NetworkImage(MENTOR_DATA[0].image!),
                              ),
                              margin: EdgeInsets.only(right: 5),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  session.mentorName!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Roboto",
                                      fontSize: 14),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  width: 100,
                                  child: Text(
                                    MENTOR_DATA[0].listMajor![0].toString(),
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Roboto",
                                        fontSize: 12,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                      ],
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: MaterialColors.primary,
                          textStyle: TextStyle(color: Colors.white),
                          shadowColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Xem chi tiết",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )),
                )
              ],
            )),
        Positioned(
            right: 25,
            top: 10,
            child: InkWell(
              onTap: (){},
              child: Icon(
                Icons.close,
                size: 24,
                color: Colors.black45,
              ),
            ))
      ],
    );
  }
}
