import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twe/common/constants.dart';
import 'package:twe/common/data_mock.dart';
import 'package:twe/models/session.dart';

class SessionItem extends StatelessWidget {
  late SessionModel session;
  void onClick() {}
  SessionItem({required this.session});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        // padding: EdgeInsets.all(10),
        child: InkWell(
          onTap: () => onClick(),
          child: Stack(
            children: [
              Container(
                  height: 230,
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Row(children: <Widget>[
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade400,
                              borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                              child: Image(
                            // color:70olors.red,
                            height: 250,
                            fit: BoxFit.cover,
                            image: NetworkImage(session.image!),
                          )),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width - 210,
                          height: 75,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  session.subject!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.attach_money_outlined,
                                      size: 22, color: MaterialColors.primary),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text("300.000 / buổi học",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.school,
                                      size: 20, color: MaterialColors.primary),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(session.mentorName!,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400)),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                      Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              Icon(Icons.timer_outlined,
                                  size: 20, color: MaterialColors.primary),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(session.date!,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400)),
                              )
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 7),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on,
                                  size: 20, color: MaterialColors.primary),
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                    COFFEE_DATA[0].coffeeName +
                                        ", " +
                                        COFFEE_DATA[0].address,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400)),
                              )
                            ],
                          )),
                      // Container(
                      //     margin: EdgeInsets.only(top: 7),
                      //     child: Row(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Icon(Icons.info,
                      //             size: 20, color: MaterialColors.primary),
                      //         Container(
                      //           width: MediaQuery.of(context).size.width - 90,
                      //           margin: EdgeInsets.only(left: 5),
                      //           child: Text(session.description!,
                      //               maxLines: 2,
                      //               overflow: TextOverflow.ellipsis,
                      //               style: TextStyle(
                      //                   fontSize: 15,
                      //                   fontWeight: FontWeight.w400)),
                      //         )
                      //       ],
                      //     ))
                    ],
                  )),
              
              Positioned(
                  right: 10,
                  bottom: 10,
                  child: Container(
                    color: Colors.white,
                    height: 40,
                    width: MediaQuery.of(context).size.width * 1 - 50,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: MaterialColors.primary,
                          textStyle: TextStyle(color: Colors.white),
                          shadowColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                        ),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Icon(Icons.person_add,
                                    size: 20, color: Colors.white),
                              ),
                              Text(
                                "Tham gia (còn 2 chỗ trống)",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )),
                  ))
            ],
          ),
        ));
  }
}
