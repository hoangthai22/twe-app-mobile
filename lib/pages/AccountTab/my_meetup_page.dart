import 'package:flutter/material.dart';

import '../../common/constants.dart';

class MySessionPage extends StatelessWidget {
  const MySessionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(0),
      // width: this.width,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 182, 24, 24),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        /* mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start, */
        children: [
          //Padding(padding: EdgeInsets.only(top: 5)),
          Container(
              color: Colors.white,
              child: ListView(
                //padding: const EdgeInsets.only(
                //right: 15, left: 15, top: 15, bottom: 30),
                children: [
                  Row(children: [
                    Container(
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black12, width: 1.0)),
                        ),
                        padding: const EdgeInsets.only(bottom: 15, top: 15),
                        child: Text(
                          "Meetup thành công",
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Roboto',
                          ),
                        )),
                    Container(
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black12, width: 1.0)),
                        ),
                        padding: const EdgeInsets.only(
                            left: 100, bottom: 10, top: 10),
                        /*child: Text(
                          "Viết đánh giá",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Roboto',
                          ),
                        )*/
                        //padding: EdgeInsets.all(30),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Row(children: <Widget>[
                                Icon(Icons.drive_file_rename_outline_sharp,
                                    size: 30,
                                    color: Color.fromARGB(255, 0, 26, 255)),
                                Text(
                                  "Viết đánh giá",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'Roboto',
                                      color: Color.fromARGB(255, 0, 26, 255)),
                                )
                              ]),
                            ])),
                  ]),
                  Container(
                    //padding: EdgeInsets.all(16.0),
                    //padding: const EdgeInsets.only(top: 10),
                    width: 50,
                    height: 150,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://firebasestorage.googleapis.com/v0/b/twe-mobile.appspot.com/o/subject%2Flambanner_dich-vu-thiet-ke-banner-1024x527.png?alt=media&token=140abaae-ae8e-4bdf-bebe-b808529928f9&fbclid=IwAR3mkZsuJEmKbQX1rN8wQQc3G2lcVDpkSiS8LmBjsLfI6_vG-6Gaa50r-w8"),
                        )),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "Database Systems",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    child: Icon(
                                  IconData(0xe743, fontFamily: 'MaterialIcons'),
                                  size: 20,
                                  color: MaterialColors.primary,
                                )),
                                Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "Nguyễn Thế Hoàng",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Text(
                              "  |",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Icon(
                                    IconData(0xf1dd,
                                        fontFamily: 'MaterialIcons'),
                                    size: 20,
                                    color: MaterialColors.primary,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "500.000",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
