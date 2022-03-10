import 'package:flutter/material.dart';

class MySessionPage extends StatelessWidget {
  const MySessionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              color: Colors.white,
              child: ListView(
                padding: const EdgeInsets.only(
                    right: 15, left: 15, top: 15, bottom: 30),
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
                ],
              )),
        ],
      ),
    );
  }
}
